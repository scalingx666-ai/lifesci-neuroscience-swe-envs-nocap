# Issue

**Title:** Small improvement to how pycbsdk calibrates timestamp conversion

## Description

time.monotonic() → time.monotonic_ns() with integer arithmetic, and median of 21 samples instead of a single measurement.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8ba45d67c190`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.