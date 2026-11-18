# Issue

**Title:** Gathering GPU arrays to CPU before saving to .mat

## Description

Without this, the GPU arrays (e.g. `U` and `W`) are saved as garbage in
the .mat file.

@marius10p ?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `baf5e64570dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.