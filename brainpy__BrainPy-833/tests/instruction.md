# Issue

**Title:** Reuse braintools.surrogate; remove duplicate brainpy.math.surrogate

## Description

## Summary

`brainpy.math.surrogate` was a shadowed duplicate of `braintools.surrogate`. `brainpy/math/__init__.py` already aliases `surrogate = braintools.surrogate`, so the local package was unused by `bm.surrogate` while still being maintained.

Additionally, the previously-pinned **braintools 0.1.10** carried surrogate correctness bugs (ERF direction, Gaussian `sigma` operator-precedence, Arctan `arctan2`, PiecewiseQuadratic gradient) — the very ones brainpy's local copy had fixed but which never reached users via `bm.surrogate`. **braintools 0.2.0** fixes all of them (and gives `QPseudoSpike` a self-consistent, finite-for-all-α form), so reusing it resolves those bugs for `bm.surrogate` users.

## Changes

- **Remove** the `brainpy/math/surrogate/` package (one-input + two-input implementations and their tests). `bm.surrogate` keeps working through the existing `braintools.surrogate` alias.
- **Bump** the `braintools` dependency to `>=0.2.0` (`pyproject.toml`, `requirements.txt`).
- **Rework** the surrogate section of `tests/audit/test_math_sparse_surrogate_fixes.py` to assert the H-20..H-24 correctness properties against the reused braintools implementations (re-export identity, grad-vs-autograd self-consistency, ERF/Arctan/Gaussian/PiecewiseQuadratic/QPseudoSpike checks). All 100 tests in the file pass.
- **Docs**: point the surrogate API page and `auto_generater` at `braintools.surrogate`; drop the removed brainpy-only two-input entries (`inv_square_grad2`, `relu_grad2`).

## Notes / compatibility

- `bm.surrogate.*` and `from brainpy.math import surrogate` continue to work. The explicit submodule import `import brainpy.math.surrogate` no longer resolves (braintools is canonical).
- The two-input surrogates `inv_square_grad2` / `relu_grad2` are removed; they were unused anywhere in the codebase and never reachable via `bm.surrogate`.
- `QPseudoSpike` gradient values change slightly (braintools 0.2.0 uses the `α+1` form), including at the default `α=2`.

## Summary by Sourcery

Reuse the canonical braintools surrogate gradient implementations in place of the local brainpy.math.surrogate package and lock in their correctness via updated tests.

Bug Fixes:
- Ensure surrogate gradients and forward functions (GaussianGrad, PiecewiseQuadratic, QPseudoSpike, Arctan, ERF) satisfy the audited H-20..H-24 correctness properties when accessed via bm.surrogate.
- Prevent regressions where bm.surrogate could silently diverge from the fixed braintools.surrogate implementations or from autograd-computed gradients.

Enhancements:
- Simplify surrogate gradient maintenance by removing the duplicated brainpy.math.surrogate package in favor of the braintools.surrogate module.
- Expand surrogate tests to verify the re-export wiring, cover all re-exported classes and functional aliases, and assert finiteness and monotonicity properties.

Build:
- Bump the braintools dependency to version >=0.2.0 in project configuration and requirements to pick up the corrected surrogate implementations.

Documentation:
- Update surrogate API documentation and automatic docs generator to reference braintools.surrogate as the canonical surrogate gradient module and drop docs for removed two-input-only entries.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `45cfe4332c15`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.