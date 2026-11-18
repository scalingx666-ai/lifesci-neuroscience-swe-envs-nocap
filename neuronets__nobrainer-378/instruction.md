# Issue

**Title:** perf(zarr): fix 725x label downsampling bottleneck + public write_zarr_shard

## Description

## Summary

- **Fix `downsample_labels`**: nearest-neighbor interpolation instead of per-label gaussian smoothing (725× speedup — 58s → 0.08s per volume)
- **Add `write_zarr_shard()`**: public function for writing a batch of volumes to an existing store, safe for SLURM job array parallelism
- **Native dtype reads**: read NIfTI as storage dtype instead of float32/int32 — 2.7× less I/O
- **Single prefetch**: one read-ahead future instead of submitting all at once — bounded memory
- **Skip shape verification**: when `target_shape` is explicitly provided

## Benchmark (100 volumes, 3 pyramid levels, 4 CPUs)

| Approach | Before fix | After fix |
|---|---|---|
| Job array script | 114s | 114s |
| `create_zarr_store` | >30 min (timeout) | **118s** |
| Raw zarr loop | 114s | 114s |

## Root cause

`downsample_labels` ran `gaussian_filter` + `zoom` for each unique label (112 iterations × 0.5s = 58s/volume). Integer labels are discrete class assignments — nearest-neighbor is the only correct interpolation.

## Test plan

- [x] Benchmark: library matches script performance (118s vs 114s)
- [x] Data integrity: labels preserved up to 2035, exact NIfTI match
- [x] `write_zarr_shard` works standalone (for SLURM job arrays)
- [ ] Existing unit tests pass

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `acbb906f1fb6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.