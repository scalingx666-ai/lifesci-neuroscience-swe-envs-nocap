# Issue

**Title:** Persist the numba JIT cache, sysmon coverage, refleak freeze

## Description

A few easy CI speedups:

1. Fix bug where `minimal` (which doesn't use data) could poison the testing data cache
2. Use `sysmon` coverage where available
3. Use `freeze` in refleak like PyVista
4. Cache numba jit generation (should only need to update when numba updates or our code changes, which is rare)

Changes drafted by Claude Fable 5 and edited / reviewed by me

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c94cecfd9f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.