# Issue

**Title:** Branch 9: Tests — seeding & dtypes

## Description

## Summary
- Add explicit random seeds to all tests using randomness for reproducible results
- Parametrize core connectivity tests over complex64/complex128 dtypes for broader coverage
- Ensure test stability across different environments and runs
- Broaden dtype coverage for complex number computations

## Test plan
- [x] Add np.random.seed(42) to all tests using random data generation
- [x] Parametrize cross_spectrum, power, coherency, and wrapper tests over complex dtypes
- [x] Verify all tests pass with same pre-existing failures (phase lag index issues)
- [x] Confirm test runs are now deterministic and reproducible
- [x] Validate complex64/complex128 precision handling

🤖 Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f78dbd6b5c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.