# Issue

**Title:** fix(analysis): fixed-point classification, nullcline selection, GD batches, plot kwargs

## Description

Fresh review of `brainpy/analysis`.

- **Critical** — 2D star vs degenerate-node stability classification was inverted (STAR branch was dead code); `±λI` matrices now correctly classified as STAR.
- **High** — phase-plane `select_candidates='nullclines'` tested the `fy` condition twice, silently dropping all fx-nullcline candidates; now `fx OR fy`.
- **Medium** — `slow_points` `num_opt_loops` was 0 when `num_opt<num_batch` -> empty losses -> `concatenate` crash; now `max(1, ceil(...))`.
- **Medium** — phase-plane streamplot passed user `linewidth` twice (`.get` not `.pop`) -> `TypeError`.
- **Medium** — `plotstyle.set_markersize` wrote a typo local, leaving the module global stale.

In-scope: 192 passed. Findings: `docs/issues-found-20260619-analysis.md`.

## Summary by Sourcery

Fix multiple correctness and robustness issues in the analysis package, primarily around 2D stability classification, phase-plane fixed point selection, and high-dimensional slow point optimization, and add targeted regression tests and audit documentation.

Bug Fixes:
- Correct 2D stability classification to distinguish proper (star) nodes from degenerate (defective) nodes based on the Jacobian being a scalar multiple of the identity.
- Ensure PhasePlane2D fixed point selection with select_candidates='nullclines' uses candidates from both fx and fy nullclines instead of dropping fx-nullcline points.
- Prevent plot_vector_field(streamplot) from raising a TypeError when a user supplies linewidth via plot_style by consuming the key before forwarding kwargs.
- Guarantee the gradient-descent slow point finder runs at least one optimization batch even when num_opt < num_batch, avoiding empty-loss concatenation crashes.
- Fix plotstyle.set_markersize to update the module-level _markersize global instead of a typo local variable, keeping schema defaults in sync.

Enhancements:
- Clarify and strengthen stability and phase-plane tests to assert the corrected star vs degenerate classifications and nullcline-based candidate selection semantics.

Documentation:
- Add an audit report documenting identified issues, severities, decisions, and fixed vs recorded-only items for the analysis package.

Tests:
- Add regression tests covering star vs degenerate 2D node classification for stable and unstable cases.
- Add regression tests to verify PhasePlane2D nullcline candidate selection uses both fx and fy nullclines when requested.
- Add regression tests ensuring streamplot linewidth customization no longer crashes and that slow point GD runs handle small num_opt values correctly.
- Add plotstyle tests for markersize updates, type checking, and plot schema validation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9845a46d1b22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.