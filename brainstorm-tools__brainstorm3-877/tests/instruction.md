# Issue

**Title:** Use mean instead of min for box tetrahedral size

## Description

Replaces the use of min with mean when calculating the maximum volume of tetrahedral elements for box primitives. This change may result in more consistent element sizing and avoid tsize = 0 (not realistic and leads to an infinite computation in line 184).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07bc9766e5f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.