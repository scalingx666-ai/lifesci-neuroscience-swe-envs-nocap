# Issue

**Title:** Speed up collision-aware amplitude scaling

## Description

Collision-aware amplitude scaling scans the whole chunk again for every selected spike, just to recover a position that's already known once the non-margin subset is built. So this bookkeeping step ends up quadratic in the number of spikes per chunk.

**Changes**

The fix keeps those flat indices and passes them to `find_collisions()`, building each collision group once instead of concatenating it over and over. The existing helper call still works as is, the fitting arithmetic doesn't change.

**Validation**

I ran two seven-pair fresh-process sweeps after one warm-up, on 100-unit, 64-channel generated recordings, through the public `analyzer.compute("amplitude_scalings", handle_collisions=True)` path with one worker and 1 s chunks. Times below are complete extension calls: 20 s at 4 Hz and 10 s at 20 Hz.

| CPU VM | ~400 spikes/chunk | ~1,995 spikes/chunk |
| --- | ---: | ---: |
| Intel Ice Lake | 1.826 → 1.552 s (**-15.0%**) | 11.604 → 9.945 s (**-14.3%**) |
| AMD Milan | 1.326 → 1.118 s (**-15.7%**) | 8.172 → 6.992 s (**-14.4%**) |
| ARM Neoverse N1 | 1.595 → 1.350 s (**-15.3%**) | 10.239 → 8.770 s (**-14.4%**) |

At high density this saves 118-166 ms per chunk, and 17,375 of the 19,954 spikes need a collision fit. All before/after ranges are separated, and all 42 measured pairs came back with identical arrays and collision counts. The public MEARec fixture also matched exactly. The complete module passes its 6 tests across sparse/dense analyzers, two segments, and memory/binary/zarr formats; Black is clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b16c672ef43d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.