# Issue

**Title:** 3dttest++/3dGroupInCorr: fix paired-zskip zeroing, BminusA negation slots, and t-to-z roundoff saturation

## Description

.

Three group-statistics correctness fixes:

1. **`-paired -zskip`**: add the missing `!IS_PAIRED` guard on the setA-only zskip reduction (mirroring the setB block). Previously, after the paired branch built pair-aligned reduced arrays, the A-only block overwrote them; when both sets contained zeros at non-identical subject indices the paired t-test detected a length mismatch and the voxel was silently written as mean=0, t/z=0. Verified with a standalone harness replicating the exact code path (correct paired t=5.0 → program output 0 before the fix).

2. **`-BminusA` + `-nomeans`/`-notests`**: negate the full `2*(mcov+1)`-slot two-sample region of `resar[]` (which always stores interleaved mean/statistic pairs) instead of `ntwosam` slots (which counts output volumes). With `-nomeans` the statistic previously kept the A−B sign while labeled B−A. The default output mode is unchanged: there `ntwosam == 2*(mcov+1)` already.

3. **`GIC_student_t2z`** (both files): compute z directly from the small 2-sided tail probability, `qginv(0.5*pp)`, instead of `1.0 - 0.5*pp` which rounds to 1.0 for p < ~2e-16 — the same roundoff fix `mri_stats.c`'s `student_t2z` has carried for years. Verified against scipy on the extracted functions: t=20/30/50 at df=20 now give 7.729466 / 8.673368 / 9.755154 (old: 7.728523 / 13.0 / 13.0); values below z≈7.7 are unchanged to 6 decimals. Affects `-toz` outputs (including `-Clustsim` z-inputs at extreme voxels) and 3dGroupInCorr.

Both files compile cleanly with `-Wall`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `515e7d91a58b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.