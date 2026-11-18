# Issue

**Title:** refactor(worker): Handle large files for update_file efficiently

## Description

Switches to writing 4MiB chunks instead of 64KiB chunks for update_file. Avoid writing to disk until the request is complete.

Fixes a bug where the tmp file could be prematurely closed leading to a failed write in some conditions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a6df33f5425`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.