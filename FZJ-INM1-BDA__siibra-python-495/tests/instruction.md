# Issue

**Title:** Fix bounds check when sampling volumes with points

## Description

#493  did not fully resolve issues with out-of-bounds points when sampling volumes (the fix only worked for integer points). I unified the code branches to handle integers, lists, and numpy arrays using the same code (less error-prone). The bounds check should now work as expected, for all valid input types.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `019ee2128937`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.