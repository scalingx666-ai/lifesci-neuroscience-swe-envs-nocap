# Issue

**Title:** [ENH] use warnings with logging in elephant.utils.round_binning_errors

## Description

This PR aims to suggest a solution to Issue #567 .

The warnings in function `round_binning_errors()` from `elephant/utils.py` are replaced by log calls.

**t.b.d.**
- [x] decide on loglevel, e.g. logging.warning ? loglevel: warning
- [x] default log level for the logger: not_set

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5b464ecd358e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.