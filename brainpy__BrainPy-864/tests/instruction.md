# Issue

**Title:** fix: SupportSTDP.stdp_update keyword typo and DSRunner deprecation warning

## Description

Fixes the two latent runtime bugs flagged during the package-wide mypy pass (#863).

## 1. `brainpy/mixin.py` — `onn_post` keyword typo
The base `SupportSTDP.stdp_update` placeholder declared the keyword `onn_post`, while every concrete override (`brainpy/dnn/linear.py`) and every caller (`brainpy/dyn/projections/plasticity.py`, tests) uses `on_post`. The placeholder body only `raise NotImplementedError`, so this was a contract/signature defect rather than a wrong-result bug, but it was the source of the STDP `[override]` friction. Signature aligned to `on_post`.

The five overrides keep their targeted `# type: ignore[override]` (the base remains a permissive `*args/**kwargs` placeholder vs. their explicit params, so the LSP mismatch stands), but their comments no longer reference the now-fixed typo.

## 2. `brainpy/runners.py:455` — `raise warnings.warn(...)`
`DSRunner.predict` did `raise warnings.warn(...)` for the deprecated `inputs_are_batching` argument. `warnings.warn` returns `None`, so `raise None` produced `TypeError: exceptions must derive from BaseException` instead of a warning. Now emits the `UserWarning` and continues, as intended.

## Validation
- `python -m mypy brainpy/` → `Success: no issues found in 432 source files`.
- New runtime check: `predict(..., inputs_are_batching=True)` now warns and continues (previously raised `TypeError`).
- Base `SupportSTDP.stdp_update` now accepts `on_post=` and still raises `NotImplementedError`.
- STDP suites (`boost_linear_test.py`, `mixin_coverage_test.py`, `test_dense_stdp_update_promotes_weight`): 91 passed.

## Summary by Sourcery

Align STDP mixin and linear layer signatures and fix DSRunner deprecation handling so it emits a warning instead of raising an error.

Bug Fixes:
- Correct the SupportSTDP.stdp_update keyword name from onn_post to on_post to match concrete implementations and callers.
- Fix DSRunner.predict to use warnings.warn for the deprecated inputs_are_batching argument instead of incorrectly raising its return value.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d684af544ee0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.