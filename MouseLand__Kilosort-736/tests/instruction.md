# Issue

**Title:** [fix] bug in run_kilosort function

## Description

`set_files` function requires `bad_channels` argument.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7103bf236806`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.