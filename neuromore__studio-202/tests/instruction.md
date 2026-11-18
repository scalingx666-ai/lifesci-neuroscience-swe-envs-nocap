# Issue

**Title:** Submodule for Private Repository

## Description

* Adds a private repository as submodule in `/priv`
* Configures the Github CI to automatically checkout the submodule
* This submodule contains code/features not included in open-source builds
* The submodule is NOT required for building the default `neuromore` branding

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60b1290429fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.