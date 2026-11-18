# Issue

**Title:** Fix: graphene mesh stealing bug

## Description

Porting this fix over from the ChunkedGraph (see here: ), as the igneous graphene mesh generation code was based on the ChunkedGraph mesh generation code, where this bug originated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ce3f1b005dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.