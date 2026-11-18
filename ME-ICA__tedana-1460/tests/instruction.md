# Issue

**Title:** Modify maxrestart to reflect number of restarts, not number of ICA attempts

## Description

.

Changes proposed in this pull request:

- This changes the behavior of `--maxrestart` by running ICA a maximum of 11 times by default (`--maxrestart 10`) and 1 time if set to 0.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ef5a33fabc5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.