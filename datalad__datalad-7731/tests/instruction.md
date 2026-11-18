# Issue

**Title:** BF: Prevent infinite recursion in clone when a remote points to itself

## Description

When cloning a repository that has its origin remote set to point to itself, DataLad would enter an infinite recursion loop in configure_origins().

This fix adds a check to prevent recursing into the same dataset path, avoiding the infinite loop reported in issue #7721.



🤖 Generated with [Claude Code](https://claude.ai/code)

Potentially there is other, trickier scenarios (chain of symlinks etc) but at least this would address an obvious issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e48124b04fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.