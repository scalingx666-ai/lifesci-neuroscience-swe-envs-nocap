# Issue

**Title:** chore(ci): Rename archive to .tar.gz

## Description

uv has dropped support for the `.tgz` extension.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4704d904b1bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.