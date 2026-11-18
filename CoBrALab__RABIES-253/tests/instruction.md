# Issue

**Title:** Update submodules to include fixed metric gradient filter

## Description

I suggested quite a while ago to pull this in. This is has already been addressed for antsMotionCorr calls.

Not tested with RABIES  yet.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3353a1c4ef8a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.