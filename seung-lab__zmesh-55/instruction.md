# Issue

**Title:** fix: avoid error in new marching cubes

## Description

The new code skips setting `c` when start or end are not at the ends of the range. This means c fields are set to 0 when they should be 1 at the ends.

The revised code switches from != to == and inverts at the end. This corrects the flaw and also makes the code easier to read.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a4fe8540f4c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.