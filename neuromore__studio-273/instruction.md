# Issue

**Title:** Fix Timinig on Apple Silicon

## Description

Use `clock_gettime_nsec_np(CLOCK_UPTIME_RAW)` instead of `mach_absolute_time()` to get a reliable nanosecond tick also on Apple Silicon

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e412400451b1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.