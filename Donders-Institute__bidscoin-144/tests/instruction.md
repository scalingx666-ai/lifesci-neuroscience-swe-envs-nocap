# Issue

**Title:** Create bidsmap_sst.yaml

## Description

Adjusted bidsmap template for the data structure created by ScanSessionTool (https://github.com/fladd/ScanSessionTool).
Adjustments include the naming of the output files (use of user-defined path names) & exclusion of folders containing linked files created by ScanSessionTool

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c398e498b1da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.