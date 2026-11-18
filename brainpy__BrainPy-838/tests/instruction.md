# Issue

**Title:** fix(optim,losses): audited correctness fixes (Adan, SM3, losses)

## Description

Fixes from fresh review of `brainpy/optim` + `brainpy/losses`.

**Critical**
- `Adan.update` crashed on every call (`lax.cond` operand splat) and its step counter was frozen at 0, disabling bias correction + Nesterov.

**High**
- `SM3` raised `KeyError` for scalar (0-dim) variables.
- `multi_margin_loss` crashed on `bm.Array` under JAX>=0.9.

**Medium**
- `l1_loss` functional default reduction changed `'sum'`->`'mean'` to match the `L1Loss` class + docstring.

Regression tests added; in-scope suite: 145 passed, 1 skipped. Full findings: `docs/issues-found-20260619-optim-losses.md`.

## Summary by Sourcery

Fix optimizer and loss correctness issues uncovered by an audit, and add regression tests and documentation for the findings.

Bug Fixes:
- Correct Adan optimizer so its update step runs without crashing, maintains its own per-update step counter, and enables proper bias correction and Nesterov behavior.
- Allow SM3 optimizer to handle scalar (0‑dimensional) trainable variables by registering and using a scalar accumulator instead of erroring.
- Make multi_margin_loss work with bm.Array inputs under newer JAX versions by converting arguments to JAX arrays before indexing.
- Align the functional l1_loss default reduction with its class wrapper and documentation by changing the default from 'sum' to 'mean'.
- Fix l1_loss regression tests to match the actual per-row L1 norm semantics of the underlying metric implementation.

Enhancements:
- Add dedicated regression tests covering Adan, SM3, l1_loss, and multi_margin_loss behavior to prevent recurrence of audited issues.
- Document the full set of audit findings and statuses for optimizers and losses in a new issues report document.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7471264983e9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.