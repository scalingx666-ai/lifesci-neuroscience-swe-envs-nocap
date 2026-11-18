# Issue

**Title:** Added multiple device support

## Description

Hi Patrick,

Nice big API additions are per usual it seems to me. This adds multi-device support. For examples on exercising the multi-device feature, check out the new skill.

Changelist:
- Fixed query parsing not passing stripped/lower-cased queries to skills.
- Added tokens/devices passed with each query.
- Added multi-device skill.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa46667178bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.