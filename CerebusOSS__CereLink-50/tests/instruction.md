# Issue

**Title:** Add protocol version check on cbOpen

## Description

This patch make hwlib (and cbsdk) throw an 'outdated' error if instrument and the library used different versions of the hwlib/protocol.

Tested on Windows with different values of cbVERSION_MAJOR and cbVERSION_MINOR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02d64fc5a6f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.