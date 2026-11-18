# Issue

**Title:** MNT: Test on Python 3.10

## Description

Should be advertising that we support 3.9. Checking that we support 3.10 while we're at it.

Next minor release should drop support for 3.6.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96c50f23deb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.