# Issue

**Title:** Prefer system-provided library for Catch2

## Description

For distro packages it is prefereable to use system-provided packages. Use the system-provided library if available.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cdf917d0936d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.