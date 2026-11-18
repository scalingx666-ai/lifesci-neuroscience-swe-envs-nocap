# Issue

**Title:** NIFTI read: fix SEQ_DEC slice-timing loop so descending slice times are kept

## Description

## Summary

Fixes a one-line loop-bound bug in `thd_niftiread.c`: the `NIFTI_SLICE_SEQ_DEC` case of the slice-timing setup used `kk >= nim->slice_end` as its loop condition instead of `kk >= nim->slice_start` (compare the `SEQ_INC` case above it and `ALT_DEC` below). The loop executed exactly once, setting only `toff[slice_end] = 0`; since `toff` is `calloc`'d, every slice offset came out zero for sequential-descending acquisitions.

Downstream, `3dTshift` then sees a uniform (all-zero) timing pattern, warns that the input has only one time offset, computes zero shifts, and performs no slice-timing correction at all while appearing to succeed. This affects any NIFTI file carrying `slice_code = NIFTI_SLICE_SEQ_DEC` — including files AFNI itself writes for seq-z datasets — leaving up to ~1 TR of uncorrected temporal misalignment across slices, and breaking AFNI→NIFTI→AFNI round trips of seq-z timing.

## Changes

- `src/thd_niftiread.c`: the `SEQ_DEC` loop now runs `kk = slice_end` down to `slice_start`, filling the descending offsets (acquisition starting at `slice_end`), consistent with the other five slice-code cases.

## Verification

All six `slice_code` loops were replicated in a standalone harness (nz=7, slice_start=1, slice_end=5, duration=0.1 s):

- old `SEQ_DEC`: all offsets 0.0 (the bug);
- fixed `SEQ_DEC`: `toff[1..5] = 0.4, 0.3, 0.2, 0.1, 0.0` — exactly mirroring `SEQ_INC`, and matching `ALT_DEC`'s last-slice-first convention;
- `SEQ_INC`, `ALT_INC`/`ALT_INC2`, `ALT_DEC`/`ALT_DEC2` unchanged and correct.

The patched file compiles cleanly with `-Wall`. One-line diff; no interface change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c2bd546a782`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.