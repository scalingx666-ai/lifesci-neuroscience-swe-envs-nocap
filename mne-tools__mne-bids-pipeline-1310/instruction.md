# Issue

**Title:** Move to prek

## Description

We're using `prek` in MNE-Python and having pretty good experiences, let's use it here instead of `lefthook` for consistency. Changes drafted with Claude Opus 5 but verified by me.

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc58bc43df40`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.