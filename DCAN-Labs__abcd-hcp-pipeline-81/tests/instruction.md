# Issue

**Title:** Update internal-tools version

## Description

Increment internal-tools from v1.0.8 to v1.0.9. The new release has changes from dcan_bold_proc that improve timeseries bandpass filtering.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `183d2b1f6a04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.