# Issue

**Title:** These 2 files need to change their "iDisplay" values

## Description

They were set up to 7, but actually is not necessary since the papaya viewer is not part of these specific tabs. Re-set to 25 and tested that works. Sorry for the inconvenience of PRing again :/

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `615ec1580d4e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.