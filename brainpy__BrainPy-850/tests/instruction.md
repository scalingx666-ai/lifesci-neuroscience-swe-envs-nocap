# Issue

**Title:** fix(dyn/rates): RNN cell reset_state crash + ThresholdLinearModel noise dt-scaling

## Description

Fresh review of `brainpy/dyn/{rates,outs,others}` + dyn base/utils.

- **High** — `RNNCell`/`GRUCell`/`LSTMCell.reset_state()` crashed (`ValueError`) in default usage; state now built via `variable()` instead of `parameter((None, ...))`.
- **Medium** — `ThresholdLinearModel` scaled Euler-Maruyama noise by `dt` instead of `sqrt(dt)` (dt-dependent noise intensity).

Prior-audit rate/oscillator/noise bugs (StuartLandau coupling, etc.) verified already-fixed. In-scope: 118 passed. Findings: `docs/issues-found-20260619-dyn-rates-base.md`.

## Summary by Sourcery

Fix RNN cell state resetting and correct ThresholdLinearModel noise scaling in the dyn/rates module.

Bug Fixes:
- Prevent RNNCell, GRUCell, and LSTMCell reset_state from crashing when called with the default unbatched arguments or via bp.reset_state, while preserving correct batched behavior.
- Correct ThresholdLinearModel stochastic update so noise intensity is independent of the integration time step by using proper Euler–Maruyama sqrt(dt) scaling for excitatory and inhibitory populations.

Documentation:
- Add an audit report documenting the dyn/rates and related modules review, the fixed issues, and remaining low-priority findings.

Tests:
- Add regression tests covering reset_state behavior for RNNCell, GRUCell, and LSTMCell across unbatched, bp.reset_state, and integer-batch modes.
- Add statistical tests to verify ThresholdLinearModel noise follows sqrt(dt) scaling and produces finite outputs under noisy conditions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d06443cff05`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.