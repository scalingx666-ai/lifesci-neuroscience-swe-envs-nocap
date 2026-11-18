# Issue

**Title:** fix(integrators/fde): CaputoEuler.reset state desync + set_default_fdeint

## Description

Fresh review of `brainpy/integrators` fractional/partial integrators.

- **High** — `CaputoEuler.reset` replaced its `f_states` Variables with plain Arrays → state desync → wrong results after reset under `IntegratorRunner` (0.911 vs correct 0.380). Now stored in a `bm.VarDict` so reset updates in place.
- **Medium** — `fdeint(method='l1')` literal default made `set_default_fdeint` a no-op for default-method calls; default `method=None` so the global fallback applies.

Core solver numerics (CaputoEuler/L1/GL) validated against reference recurrences; prior-audit FDE bugs (C-08, H-30/31/32) verified already-fixed. In-scope: 5 passed. Findings: `docs/issues-found-20260619-integrators-fde-pde.md`.

## Summary by Sourcery

Fix fractional integrator state handling and default method selection for FDE solvers.

Bug Fixes:
- Preserve CaputoEuler memory state variables across reset calls to avoid desynchronization when used with IntegratorRunner.
- Ensure fdeint honors the globally configured default FDE method by changing the method parameter’s default to use the global fallback.

Documentation:
- Document the FDE/PDE integrator review, including validated numerics and previously reported issues, in a new issues-found report.

Tests:
- Add regression tests verifying CaputoEuler.reset keeps memory buffers as Variables and produces the same results as a fresh integrator run.
- Add a generic-level test confirming fdeint respects set_default_fdeint when the method argument is omitted.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dca2e8008515`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.