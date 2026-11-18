# Issue

**Title:** [MNT] - Small fix up for null models

## Description

Couple small fixes:
- in `FOOOFGroup`, update the docs to match that the attributes are called `n_null_` and `null_inds_`
- in report generation, use the `n_null_` attribute instead of counting missing exponents

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dcb5d6f017c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.