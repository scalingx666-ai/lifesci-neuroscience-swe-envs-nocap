# Issue

**Title:** decoding: Add slab-based affinity CC and parallel HDF5 reading (~43x faster postprocessing)

## Description

## Summary
Faster affinity connected-component postprocessing, with output unchanged. On one full volume (3000×3000×1350 float16 affinities, 16 CPUs), read + threshold + decode drops from 3393 s with `read_hdf5` + `backend="numba"` to 79 s with the new reader and slab backend (~43×). Peak memory drops from 194 GiB to 97 GiB. Every output is identical to the numba backend in values and dtype. Both features are opt-in: `decode_affinity_cc` still defaults to `backend="cc3d"`, and `"auto"` still resolves to `"numba"`.

**Commit 1: ruff fixes in `decoders/segmentation.py`**
- Lint only (UP035/UP006/B028): `collections.abc.Sequence`, builtin `tuple` annotations, and `stacklevel=2` on four `UserWarning`s. No behavior change. This lets the file pass the changed-file lint gate, which commit 2 triggers by touching `decode_affinity_cc`.

**Commit 2: slab affinity CC backend + parallel HDF5 affinity threshold reader**
- `decode_affinity_cc(backend="slab")` replaces numba's repeated min-label sweeps with a single pass:
  - cc3d runs on each X slab of the 6-connected affinity graph;
  - labels are compacted in first-appearance order;
  - a union-find joins components across slab boundaries;
  - a fused final renumber produces the output.
- Output values and dtype equal `backend="numba"` whenever its sweeps converge. The partition equals `numba_serial`, which labels differently for `edge_offset=1`.
- New keywords, used only by `backend="slab"`:
  - `num_workers`;
  - `parallel`: `"auto"`, `"processes"`, `"fork"`, `"forkserver"` or `"threads"`;
  - `buffer_dir`.
- On Linux, `"auto"`/`"processes"` forks the caller:
  - the hard-affinity array is inherited, not copied;
  - labels live in an anonymous shared mapping;
  - worker kernels are precompiled before forking;
  - per-call state goes through the executor initializer;
  - a worker that dies raises `BrokenProcessPool` instead of hanging.

  Forking a process whose other threads hold locks can deadlock the children. Use `parallel="forkserver"` (the default on non-Linux POSIX) or `"threads"` when that matters. The forkserver path copies the input into shared files and measured about 3× slower on a full volume.
- `connectomics.data.io.read_hdf5_affinity_threshold` reads a `(C, X, Y, Z)` HDF5 affinity dataset in X blocks aligned to the HDF5 chunks, using forkserver/spawn workers, and returns the boolean hard affinities.
  - The result equals NumPy's native-dtype `ds[channels] > threshold`.
  - float16 uses a 65,536-entry lookup table, so every bit pattern compares exactly, including NaN, ±inf and negative values.
  - Channels follow NumPy indexing, so reordered, duplicated and negative indices work. Big-endian datasets are read correctly.
- `connectomics/utils/shared_buffer.py`: file-backed shared arrays for the forkserver path. Storage is reserved with `posix_fallocate` before mapping, and buffers are cleaned up on every exit path.

**Benchmark** (full volume, 3000×3000×1350 float16 LZF, chunks `(1, 32, 128, 128)`, threshold 0.66, fresh process per run pinned to N CPUs, peak = cgroup anon+shmem; every output identical by sha256 and dtype, 165,200 segments, uint32):

| Setup | Reader | CC backend | CPUs | Read + threshold | Decode | Total | Peak memory |
|---|---|---|---:|---:|---:|---:|---:|
| **Before** | `read_hdf5` (serial, float16 in memory) | `numba` | 16 | 183 s | 3210 s | 3393 s | 194 GiB |
| **After** | `read_hdf5_affinity_threshold` (parallel, bool) | `slab` | 4 | 84 s | 115 s | 198 s | 85 GiB |
| **After** | `read_hdf5_affinity_threshold` (parallel, bool) | `slab` | 8 | 48 s | 69 s | 117 s | 89 GiB |
| **After** | `read_hdf5_affinity_threshold` (parallel, bool) | `slab` | 16 | 30 s | 48 s | 79 s | 97 GiB |
| **After** | `read_hdf5_affinity_threshold` (parallel, bool) | `slab` | 32 | 21 s | 40 s | 61 s | 109 GiB |
| Backend only | `read_hdf5` (serial, float16 in memory) | `slab` | 16 | 169 s | 163 s | 332 s | 162 GiB |

- **Before**: current path. Read the whole float16 volume, then `decode_affinity_cc(aff, 0.66, backend="numba")`.
- **After**: both new pieces. `read_hdf5_affinity_threshold(path, 0.66)` returns boolean hard affinities directly, then `connected_components_affinity_3d_slab(hard)` decodes them.
- **Backend only**: an existing pipeline that only switches the decoding config to `backend: slab`. The reader is unchanged, so the decoder still thresholds the float16 array single-threaded.
- The 16- and 32-CPU rows come from an exclusive, otherwise idle 60-CPU node: median of 3 runs in alternating order. The 32-CPU decode ranged 38–40 s. One of four 16-CPU runs decoded in 82 s; the others took 48–49 s.
- The 4- and 8-CPU rows are medians of 3 runs on shared nodes, which varied by less than 7%.
- Use the reader together with the slab backend for large volumes; the backend alone gives ~10× but keeps the serial read and float16 memory.

Recommended for large affinity volumes:
- `hard = read_hdf5_affinity_threshold(path, threshold, num_workers=N)`
- `seg = connected_components_affinity_3d_slab(hard, edge_offset=..., num_workers=N)` (from `connectomics.decoding.decoders.affinity_cc_slab`), or `decode_affinity_cc(..., backend="slab", num_workers=N)` from a decoding config
- Scripts that use either feature need an `if __name__ == "__main__":` guard because of the forkserver/spawn workers. Keep `TMPDIR` short: the forkserver socket path has a 108-byte limit, and exceeding it raises `OSError: AF_UNIX path too long`.

## Test plan
- [x] New tests:
  - `test_affinity_cc_slab.py`: structured and random fixtures for both `edge_offset` values against numba (values + dtype) and numba_serial (partition). Also covers:
    - orphan fill, `affinity_channels`, empty axes, uint64 promotion;
    - fork and forkserver modes, concurrent calls, worker death;
    - a fork-safety subprocess with live numba threads and a held lock.
  - `test_affinity_threshold_reader.py`:
    - all 65,536 float16 patterns × 17 thresholds;
    - big-endian, bool, uint8 and float32 datasets;
    - channel ordering, bounding boxes, the process path;
    - cleanup after a corrupted LZF chunk.
  - `test_shared_buffer.py`: reservation failures, including a real `RLIMIT_FSIZE` failure, mapping lifetime, and worker death.
  - `connectomics.data.io` public API snapshot in `test_v3_guardrails.py`.
- [x] New tests + guardrails + related decode tests (`test_banis_features.py`, `test_decode_graph.py`): 367 passed.
- [x] Full-volume equivalence: every slab and reader run above matches `read_hdf5` + `backend="numba"` by sha256 and dtype.
- [x] Changed-file lint as in CI: `ruff check`, `ruff format --check` and `mypy --config-file .github/mypy_changed.ini` all exit 0.
- [x] Guard tests: no new failures vs origin/master. Existing failures come from the `neuron_j0126` tutorials, missing `cloud-volume`, and `test_affinity_cc3d.py::TestAffinityCC3D::test_threshold_sensitivity`, which also fails at `0a6e4c68`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0a6e4c680d12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.