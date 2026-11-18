# Issue

**Title:** BUG: Fix bug with Evoked plots for sub-average

## Description

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)

Fixes a bug introduced in 1.10.0 where the `sub-average` report didn't contain grand-average Evoked plots because these were written into the report of the last subject instead :facepalm: 

We should probably cut a release after this. @drammock if you agree, should we just make it a 1.10.1 (with the speed enhancements) or a new 1.11.0?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `92a8b045bc71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.