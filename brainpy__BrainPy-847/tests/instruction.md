# Issue

**Title:** fix(dyn/synapses): DualExp equal-tau + STP per-neuron reset

## Description

Fresh review of `brainpy/dyn/{synapses,projections}`. Three High fixes:

- `DualExpon` raised `ZeroDivisionError`/`NaN` when `tau_rise == tau_decay`; now uses the `e/tau` limit element-wise (matches `Alpha`).
- `DualExponV2` silently produced zeros/NaN for equal taus; now raises a clear `ValueError` pointing to `bp.dyn.Alpha`.
- `STP.reset_state` crashed for a per-neuron array `U` (`Variable.fill_` needs a scalar); now broadcasts.

Prior-audit synapse/projection bugs (STP u growth, double-comm, STDP, PoissonInput std) verified already-fixed. In-scope: 181 passed. Findings: `docs/issues-found-20260619-dyn-synapses.md`.

## Summary by Sourcery

Fix edge-case behaviour of dual-exponential synapses and STP reset, and record audit findings for dyn/synapses and projections.

Bug Fixes:
- Handle DualExpon synapses with equal rise and decay time constants without crashes or NaNs by using a well-defined alpha-function limit.
- Make DualExponV2 explicitly reject equal-tau configurations with a clear error message instead of producing invalid or silent-zero outputs.
- Allow STP synapses to reset correctly when the release probability U is provided as a per-neuron array, including in batched modes.

Documentation:
- Add an audit report documenting identified and previously fixed issues in dyn/synapses and dyn/projections, including rationale for recorded-but-unfixed items.

Tests:
- Add regression tests covering DualExpon equal-tau behaviour, DualExponV2 equal-tau error handling, and STP reset and dynamics with scalar and per-neuron U configurations.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b4462f04e78c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.