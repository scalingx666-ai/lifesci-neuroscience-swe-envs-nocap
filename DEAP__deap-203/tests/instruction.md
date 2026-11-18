# Issue

**Title:** Fix ClosestValidPenalty to use distance

## Description

Add check in test and example to verify the final population is close to bounds.
Increase penalty factor (alpha) to 1.e6, to help guide the individuals back in bounds.
Decreased Hypervolume threshold for test. Now that the final solution is
valid, the resulting hypervolume is no longer consistently high.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `759473d39dc3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.