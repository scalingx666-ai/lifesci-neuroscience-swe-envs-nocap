# Issue

**Title:** fix(math/compat): gelu int input, unflatten negative dim, segment_mean Array

## Description

Fresh review of `brainpy/math` NumPy/PyTorch/TF compat + activations.

- **High** — `gelu` silently wrong on integer input (now promotes to float like `jax.nn.gelu`).
- **High** — `compat_pytorch.unflatten` ignored negative `dim` (torch-style `dim=-1` raised); now normalized + range-checked.
- **Medium** — TF-compat `segment_mean`/`unsorted_segment_mean`/`unsorted_segment_sqrt_n` passed an un-converted `bm.Array` to `jnp.ones_like` (relied on JAX's removed implicit `__jax_array__`); now converted once.

Regression tests added (119 passed in-scope). Findings: `docs/issues-found-20260619-math-compat.md`.

## Summary by Sourcery

Fix math compatibility issues in activations and TensorFlow/PyTorch shims and add regression coverage and documentation for the 2026-06-19 audit.

Bug Fixes:
- Correct gelu to promote integer and boolean inputs to floating dtypes and align the exact formulation with current JAX APIs.
- Update compat_pytorch.unflatten to honor negative dimensions with PyTorch-style semantics and to validate dimension ranges.
- Fix TensorFlow-compat segment_mean and unsorted_segment_* helpers to consistently convert inputs to JAX arrays before constructing denominators, avoiding reliance on deprecated implicit array conversion.

Documentation:
- Add an audit report documenting math compatibility and activation issues, their impact, and fix status for the 2026-06-19 review.

Tests:
- Add regression test suite covering gelu integer-input behavior, compat_pytorch.unflatten negative and out-of-range dims, and TensorFlow segment helpers on brainpy Array inputs and under jit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a629ee47b2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.