# Issue

**Title:** fix: Adapt to transposed ndcoords in nitransforms

## Description

nipy/nitransforms#271 transposed image coordinate arrays. In the case of fMRIPrep, this was something we were transposing around, so this fix slightly simplifies things.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab58dc95e173`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.