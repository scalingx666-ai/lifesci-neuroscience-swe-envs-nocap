# Issue

**Title:** Fix source space filename detection

## Description

Claude Sonnet 5 provided an initial draft of the code changes, but I adjusted it and vouch for all content.

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77827c4348b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.