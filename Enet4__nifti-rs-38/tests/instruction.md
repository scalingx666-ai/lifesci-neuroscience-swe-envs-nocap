# Issue

**Title:** Improve Travis CI jobs for better coverage

## Description

This reduces the number of Travis jobs from 18 to 9, while increasing useful coverage.

- Windows and Mac OS: only test stable with ndarrays;
- Add cross target mips64 for big endian testing.

One of the builds is expected to fail because of #34.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2838d74cc366`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.