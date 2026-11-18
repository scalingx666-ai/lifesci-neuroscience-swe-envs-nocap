# Issue

**Title:** chore: Split Dockerfile into base and pixi layers

## Description

FreeSurfer downloads are extremely finicky, and I feel bad about hitting their server as much as we do. This is something we experimented on in PETPrep, to put the non-Pixi (conda, in PETPrep) dependencies in one image that gets pushed to ghcr.io, and then building on top of that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04ef0cf8aeef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.