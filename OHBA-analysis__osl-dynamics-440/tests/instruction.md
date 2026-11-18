# Issue

**Title:** Fix detect_bad_channels() to exclude annotated bad segments

## Description

When loading raw data, `detect_bad_channels()` did not specify `reject_by_annotation='omit'`, meaning that segments previously annotated as bad were included in the standard deviation calculation used for bad channel detection.

The fix adds` reject_by_annotation='omit' `to exclude these segments.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f83afe1e1f9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.