# Issue

**Title:** Add an optional GPU backend: `kimimaro.skeletonize(..., gpu=True)` via Brook

## Description

# Add an optional GPU backend: `kimimaro.skeletonize(..., gpu=True)` via Brook

Follows the discussion in #127. `pip install "kimimaro[gpu]"` installs [Brook](https://github.com/giorgioangel/brook)
(`brook-cu12`, a CUDA implementation of this TEASAR variant) and `skeletonize(..., gpu=True)` hands the call to it.
Nothing is vendored, `import kimimaro` and every `gpu=False` call are unchanged and never import Brook.

## What it does
- `kimimaro.skeletonize(..., voxel_graph=None, gpu=False)`: `gpu` is the last parameter. `gpu=True` calls
  `brook.skeletonize` with the same arguments and returns its `{label: osteoid.Skeleton}` unchanged.
- It never falls back silently (the output differs from CPU mode): `ImportError` with the install hint if Brook is
  missing, Brook's `CudaError` (a `RuntimeError`) if there is no usable GPU. `kimimaro.gpu.is_available()` probes
  without raising.
- `parallel` / `parallel_chunk_size` are ignored (a warning if `parallel != 1`). `brook.DimensionError` is re-raised as
  `kimimaro.DimensionError`. With `voxel_graph`, `fill_holes` or `fix_avocados` Brook is run in-core
  (`streaming=False`) because its streaming mode does not support them.
- `kimimaro forge --gpu`. README: a `gpu` section and a short "Differences from CPU mode".

## Install matrix
The extra is `brook-cu12>=0.1,<0.2; sys_platform == 'linux' and platform_machine == 'x86_64' and python_version >= '3.12'`
(Brook only ships those wheels), so `kimimaro[gpu]` installs nothing on other platforms. On Linux x86-64 with
Python >= 3.12 it also pulls `numpy>=2.4.6,<3`, `osteoid>=0.7.2` and `tqdm>=4.67.3`. Brook is 0.x, so the pin needs a
kimimaro release to admit 0.2. Needs an NVIDIA GPU of compute capability >= 8.0 and a CUDA 12.3+ driver.
Suggested version for the next release: 5.9.0 (new feature); this PR does not bump it.

## Not identical to CPU mode
As agreed in #127 this is documented in the README. Main reasons: equal-cost route tie-breaking (on the benchmark volume
and its crops total cable length is 0.02%-1.3% shorter with `fix_branching=False`; roughly 10%-18% on smooth symmetric
test shapes) and soma handling.

## Tests
`automated_test.py` moves into `automated_testing/` next to the new suites; `pytest` finds them through `testpaths` /
`python_files` in `pyproject.toml`, and the existing CI job runs the folder.
- `automated_test_gpu.py` (runs everywhere, in CI): a stubbed `brook` checks import isolation, dispatch, forwarding,
  warnings, error translation and the packaging contract; with the real wheel but no GPU `gpu=True` must raise.
- `automated_test_gpu_hw.py` (needs a GPU, skipped otherwise): output contract, CPU-vs-GPU agreement with limits
  calibrated from observed worst cases, every option through `gpu=True`, CPU functions on GPU output, and soma
  regressions that hold on both backends.
- `automated_test_cli.py`.
- Local results: RTX 4090, Py 3.12: 148 passed, 3 skipped. No visible GPU: 106 passed, 45 skipped. Py 3.9 (no Brook):
  103 passed, 48 skipped. Also checked in fresh `python:3.12` / `python:3.9` containers with no NVIDIA driver (real
  `brook-cu12` wheel on 3.12). GitHub runners have no GPU, so the GPU tests are not run in CI.

## Benchmarks (`benchmarks/benchmark_gpu.py`, results in `benchmarks/README.md`)
512^3 benchmark volume, RTX 4090 vs i9-14900KF, Kimimaro 5.8.5:

| Volume | `fix_branching` | CPU 1 core | CPU 32 workers | GPU (median of 3) | vs 32 workers |
| :-- | :-- | --: | --: | --: | --: |
| 256^3 | on | 28.4 s | 25.5 s | 0.38 s | 66x |
| 384^3 | on | 152.6 s | 94.1 s | 1.62 s | 58x |
| 512^3 | on | 855.6 s | 409.5 s | 2.98 s | 137x |
| 512^3 | off | 236.5 s | 107.3 s | 2.59 s | 41x |

Per object the cable length differs by a median of <= 0.96% (p95 <= 4.4%).

## Licence
Kimimaro stays GPL-3.0-or-later; Brook is GPL-3.0-only and is an optional, non-vendored dependency, so an environment
with both is effectively GPL-3.0.

## Found while testing (separate issue, not part of this PR)
With `fix_branching=True`, 5.8.5 appends the soma root to every traced path, which adds cycles and long straight edges.
It accounts for the -14% total-cable difference at 512^3 in the table above.

## Not included (available if you want them)
A CI job that installs the `gpu` extra, a larger benchmark harness with memory sampling, and exhaustive GPU option/determinism
tests exist on a separate branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b7543fbb893f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.