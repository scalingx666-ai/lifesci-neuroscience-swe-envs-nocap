# Issue

**Title:** fix(math/sparse): coo_to_csr bounds check + sparse/event/delay regression suite

## Description

Fresh review of `brainpy/math` sparse/event/jitconn operators + delay variables.

- **Medium** — `coo_to_csr` silently produced a corrupt CSR (`indptr[-1] != nse`) on out-of-range `pre_ids`; now raises a clear `ValueError`.
- Added a thorough regression suite verifying CSR/COO/event matvec & matmat and jit-connectivity ops against dense references (including `transpose=True` and autodiff), and TimeDelay/LengthDelay ring-buffer modulo-wrap behavior. Prior-audit findings (csrmm transpose, TimeDelay modulo, coomv) verified already-fixed and now locked by tests.

In-scope: 58 passed. Findings: `docs/issues-found-20260619-math-sparse-event.md`.

## Summary by Sourcery

Tighten sparse COO-to-CSR conversion error handling and add regression coverage for sparse/event operations and delay variables.

Bug Fixes:
- Raise a clear ValueError in coo_to_csr when pre_ids fall outside [0, num_row) to avoid generating structurally invalid CSR matrices.

Enhancements:
- Document coo_to_csr behaviour and constraints, including its eager-only nature due to jnp.unique.

Documentation:
- Document the results of the math/sparse, math/event, jit connectivity, and delay variable audit in a new issues-found report.

Tests:
- Add regression tests for coo_to_csr, csr_to_coo, and csr_to_dense against dense references.
- Add regression tests for CSR matrix-matrix multiplication, COO matrix-vector multiplication, and event-driven CSR matmat to match dense and autodiff behaviour, including transpose variants.
- Add regression tests for pre_syn_post helpers to validate event routing and per-group reductions.
- Add regression tests for TimeDelay and LengthDelay ring-buffer wrap-around behaviour to lock in correct modulo/rotation semantics.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `efc7dc97cf38`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.