# Issue

**Title:** fix(integrators): RKF45 node + KlPl SRK diffusion weights

## Description

Fresh review of `brainpy/integrators` ode/sde.

**Critical** — RKF45 6th-stage node `c6` was `1/3` instead of `1/2`, silently collapsing the integrator to **order 1** for any time-dependent RHS (verified: order 1.0 -> 5.0 on dy/dt=cos(t)).

**High** — KlPl strong SRK scheme's final-stage diffusion weights were wrong (`g1+g2 != I1`), so it did not converge; corrected to `g1=I1-I11/sqrt(h)`, `g2=I11/sqrt(h)`.

Regression tests added incl. order/convergence checks (226 passed in-scope). Findings: `docs/issues-found-20260619-integrators-ode-sde.md`.

## Summary by Sourcery

Fix numerical correctness issues in the RKF45 ODE integrator and KlPl SRK SDE scheme and add regression tests and documentation for the integrators audit.

Bug Fixes:
- Correct the RKF45 Butcher tableau last node from 1/3 to 1/2 to restore fifth-order accuracy for time-dependent ODEs.
- Fix the KlPl strong SRK final-stage diffusion weights so the scheme satisfies the diffusion consistency condition and converges.
- Align the generated KlPl step code with the corrected diffusion weights to remove the spurious mixed-integral term from g1.

Enhancements:
- Add convergence-order regression tests for RKF45 on a time-dependent ODE to guard against future tableau regressions.
- Add KlPl SDE convergence and integrator-vs-reference consistency tests driven by shared Wiener paths.
- Document the results of the ODE/SDE integrator audit, including recorded-but-unfixed low-severity issues, in a new markdown report.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `564aed27069a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.