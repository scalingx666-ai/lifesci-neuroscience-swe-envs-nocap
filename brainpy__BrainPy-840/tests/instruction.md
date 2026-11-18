# Issue

**Title:** fix(math/object_transform): cond/ifelse, collectors, VariableView edge cases

## Description

Fresh review of `brainpy/math/object_transform`. Four Medium correctness/robustness fixes:

- `bm.cond` now accepts constant (non-callable) branches as documented.
- `bm.ifelse` now accepts a scalar bool/array condition as documented.
- `Collector.__sub__` raises the descriptive `ValueError` (not a bare `KeyError`).
- `VariableView.value` setter mirrors the hardened `Variable` setter (unwraps `State`, canonicalizes numpy dtype, handles plain inputs).

Regression tests added (231 passed in-scope). Findings: `docs/issues-found-20260619-math-object-transform.md`.

## Summary by Sourcery

Improve robustness and documented-behavior compliance of math object-transform utilities and add regression coverage for discovered edge cases.

Bug Fixes:
- Allow bm.cond to accept constant (non-callable) branches in line with its documented API.
- Allow bm.ifelse to accept a scalar boolean or boolean array as the conditions argument without crashing.
- Ensure Collector.__sub__ raises a descriptive ValueError when attempting to remove a value object that is not present, instead of a bare KeyError.
- Align VariableView.value setter behavior with Variable.value by unwrapping state-like inputs, canonicalizing numpy dtypes, and using safe shape/dtype checks to avoid AttributeError.

Documentation:
- Add an audit report documenting the 2026-06-19 review of brainpy/math/object_transform, including fixed and recorded issues.

Tests:
- Add regression tests for bm.cond handling of constant versus callable branches.
- Add regression tests for bm.ifelse with scalar Python bool and scalar array bool conditions.
- Add regression tests covering VariableView.value setter behavior with Python lists, numpy dtype canonicalization, and State unwrapping.
- Add regression test verifying Collector.__sub__ error behavior when subtracting a missing value object.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f1fbb0d9d66`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.