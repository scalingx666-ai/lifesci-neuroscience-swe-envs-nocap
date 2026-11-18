# Issue

**Title:** MNT: updated get_data to get_fdata to support latest nibabel (5.0).

## Description

Worth looking into consequences of this a bit more before merge, perhaps; just a find and replace so far, but seems to work (with limited testing).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d75cdb9bdd21`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.