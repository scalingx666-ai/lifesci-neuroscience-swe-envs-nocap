# Issue

**Title:** Retry 3 times when downloading from gnu mirrors

## Description

Update readline to a more modern version (7.0 => 8.3).

Sometimes the mirrors are not really stable so it failed the creation of wheels on macos

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9442b3b64d4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.