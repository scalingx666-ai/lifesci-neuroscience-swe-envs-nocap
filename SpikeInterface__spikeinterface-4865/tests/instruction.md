# Issue

**Title:** Fix(extractors): add gap_tolerance_ms to Neuralynx extractors

## Description

Fixes failing Neuralynx tests. On the NEO side,  added `gap_tolerance_ms` to the Neuralynx reader, so this PR simply propagates it to the wrapper and sets it to tests to avoid failures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ce0e18b4d48`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.