# Issue

**Title:** fix(core): DSRunner memory_efficient output/monitors; eager check bound validation

## Description

Fresh review of top-level glue (`dynsys`, `runners`, `delay`, `mixin`, `transform`, `check`, shims).

- **Critical** — `DSRunner(memory_efficient=True)` returned `None` instead of model outputs (`list.append` inside `tree_map`); now accumulates and stacks per-step outputs on a leading time axis.
- **High** — `memory_efficient` monitors came out time-major vs the standard path's batch-major in `BatchingMode`; now axis-matched.
- **High** — `check.is_float`/`is_integer` bound checks never raised eagerly (a `pure_callback` swallowed the raise for concrete predicates); added a concrete fast-path that raises directly, preserving the deferred path under tracing.

⚠️ Blast radius: `check.is_float/is_integer` with bounds now actually reject invalid input across all call sites (valid defaults verified to still construct). In-scope: 441 passed. Findings: `docs/issues-found-20260619-toplevel-glue.md`.

## Summary by Sourcery

Fix DSRunner memory-efficient output and monitor layout while tightening eager bound-checking behavior.

Bug Fixes:
- Ensure DSRunner(memory_efficient=True) returns time-stacked model outputs instead of None, matching the standard path for both scalar and pytree outputs.
- Align memory-efficient monitor axis ordering with the standard batch-major layout in BatchingMode so monitor shapes no longer depend on the memory_efficient flag.
- Make is_float and is_integer min_bound/max_bound checks raise eagerly for out-of-bound values while preserving deferred in-jit error signaling.
- Update jit_error and jit_error_checking_no_args to raise synchronously for concrete predicates, and adjust tests to reflect the new error behavior.
- Prevent DSRunner tests from leaking a modified global dt across test cases by restoring the default dt after each test.

Documentation:
- Add an audit report documenting identified issues and their fix/record status for top-level glue components.

Tests:
- Add regression tests covering DSRunner memory_efficient outputs and monitor shapes, including batched models and update methods that return None.
- Add regression tests asserting eager bound checks and jit_error helpers raise or not raise as expected in both eager and jitted contexts.
- Strengthen existing coverage tests for check.* utilities to expect the new eager-raising semantics.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `371469259de2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.