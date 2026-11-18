# Issue

**Title:** Round before casting preprocessed traces to integer dtypes

## Description

Several preprocessors cast their float result straight to an integer `dtype` with `astype()`, which truncates toward zero instead of rounding. Over many samples that biases the output (toward zero for centered data, downward otherwise). `filter.py` already rounds before the same cast — this brings `whiten`, `common_reference` and `highpass_spatial_filter` in line with it. It also drops the `offset.astype(dtype)` cast in `ScaleRecording`, which was silently zeroing fractional offsets for integer dtypes.

Added tests covering the integer-rounding paths.

Noticed while looking at #1972; this addresses the integer-cast rounding, not the zscore/`int_scale` std question in that issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `201d87c3dee2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.