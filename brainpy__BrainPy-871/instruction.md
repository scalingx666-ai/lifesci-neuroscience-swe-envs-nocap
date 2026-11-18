# Issue

**Title:** fix: import concrete_or_error from jax.extend.core on JAX>=0.11

## Description

`jax.core.concrete_or_error` was removed in JAX 0.11 (deprecated in 0.10). Import it from `jax.extend.core` (available since 0.10), falling back to `jax.core` on older JAX. Updates the one call site in `math/activations.py`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Bug Fixes:
- Fix one_hot activation to use a version-compatible import of concrete_or_error across different JAX releases.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `edd1e8e401f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.