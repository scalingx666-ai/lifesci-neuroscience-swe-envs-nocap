# Issue

**Title:** Only recheck necessary mechanisms after cut

## Description

Only mechanisms which are split by a cut, or concepts whose purviews are affected are recalculated after a system cut.

Also implement matlab approximation option

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a76801af95c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.