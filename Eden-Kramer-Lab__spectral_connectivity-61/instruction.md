# Issue

**Title:** feat(sim): deterministic MVAR via random_state; fix coeff shape docs

## Description

## Summary
- Add `random_state` parameter to `simulate_MVAR` for reproducible simulations
- Support int, `np.random.Generator`, or None as random state input
- Fix coefficient shape docstring from incorrect to `(n_lags, n_signals, n_signals)`
- Add comprehensive test suite for simulation module

## Changes
- Use modern `np.random.default_rng()` instead of legacy `np.random` functions
- Added 3 new tests verifying seeded determinism and different behaviors

## Test plan
- [x] Two runs with same seed produce identical outputs
- [x] Different seeds produce different outputs
- [x] Generator instance works correctly
- [x] All existing tests still pass

🤖 Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f6c09500d38`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.