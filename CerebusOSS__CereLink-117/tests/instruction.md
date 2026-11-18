# Issue

**Title:** cbpy: Use str for label in get_sample_group, not bytes

## Description

For consistency with label returned by get_channel_config.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c076b48bee4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.