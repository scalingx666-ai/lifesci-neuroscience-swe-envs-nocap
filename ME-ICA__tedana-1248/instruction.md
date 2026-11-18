# Issue

**Title:** Add 'exclude' option to t2smap workflow

## Description

. I'm happy to work on a more advanced method (e.g., something that accepts an array of values) if people would like that.

Changes proposed in this pull request:

- Add `--exclude` option to `t2smap`. It accepts a comma-separated list of values (e.g., `1,3,5`), a start-inclusive and end-inclusive range (e.g., `0:5`), or a mix of the two (e.g., `0,2,4,6:10`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `683b6b4ea06f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.