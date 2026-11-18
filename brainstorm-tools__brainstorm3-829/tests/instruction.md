# Issue

**Title:** Better detect BOLD and NIRS to avoid sign flip

## Description

Edit: we should update https://github.com/brainstorm-tools/brainstorm3/blob/master/toolbox/process/functions/process_source_atlas.m#L196-L201 too

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a764edcba345`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.