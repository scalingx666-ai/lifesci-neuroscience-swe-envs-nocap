# Issue

**Title:** WRAPPER: Fix help merge in smriprep-docker

## Description

With a sufficiently wide terminal, `argparse` can decide to rearrange the usage string. Instead of splitting on lines, split on whitespace. We're still looking for the last three items.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad4401c95583`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.