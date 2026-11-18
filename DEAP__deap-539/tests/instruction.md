# Issue

**Title:** Fix divided by zero in selNSGA3

## Description

I had an issue with a division by zero in the find_intercepts function ().

Apparently this is caused by numpy.linalg.solve which sometimes does not detect the singularity of the input matrix and thus does not throw an exception ().

This pull request would fix this issue by detecting solutions with zeros.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d328fe6b68e7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.