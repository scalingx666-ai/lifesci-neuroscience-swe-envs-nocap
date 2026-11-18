# Issue

**Title:** fix(math): ShardedArray pytree flatten + remove_diag guard

## Description

Fresh review of `brainpy/math` core.

**High** — `ShardedArray` pytree round-trip dropped `_keep_sharding`, raising `AttributeError` under every JAX transform (jit/vmap/scan/grad/tree_map). Added `tree_flatten`/`tree_unflatten` carrying `_keep_sharding` in aux_data.

**Medium** — `remove_diag` raised an opaque broadcasting error on tall (m>n) matrices; added a clear `ValueError`.

Regression tests added (106 passed in-scope). Findings: `docs/issues-found-20260619-math-core.md`.

## Summary by Sourcery

Fix ShardedArray pytree behavior and clarify remove_diag shape constraints, adding regression coverage and documenting findings from a math-core audit.

Bug Fixes:
- Preserve ShardedArray value and _keep_sharding flags across JAX pytree flatten/unflatten so it works under jit/vmap and other transforms.
- Guard remove_diag against tall (m > n) matrices by raising a clear ValueError while keeping existing behavior for supported shapes.

Documentation:
- Document results of the 2026-06-19 BrainPy math-core audit, including newly fixed and recorded issues.

Tests:
- Add regression tests covering ShardedArray pytree round-trips and use under jit/vmap, and the new remove_diag shape guard plus existing valid/invalid cases.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `368e28eb833a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.