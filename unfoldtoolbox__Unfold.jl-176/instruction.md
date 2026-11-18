# Issue

**Title:** backward compatible loading of JLD2 files

## Description

this fixes a problem that JLD2 cannot reconstruct the LinearModelFit that has been recently changed to ensure estimate & standarderror have the same type.

Now `modelfit(ufmodel)` creates a new LinearModelFit

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3194e0d6d72e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.