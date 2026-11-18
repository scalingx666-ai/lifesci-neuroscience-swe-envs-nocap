# Issue

**Title:** fix(dynold): STP construction, sparse-synapse drift, plasticity decay, Bellec init

## Description

Fresh review of legacy `brainpy/dynold`.

- **Critical** — `STP.reset_state` passed args to `variable_` in the wrong order, making STP unconstructable.
- **High** — sparse `Exponential+stp`/`DualExponential` passed `method='cusparse'` to `csrmv` which no longer accepts it -> `TypeError` on every sparse update.
- **High** — sparse `Exponential+stp` fed raw `pre_spike` to `csrmv` instead of the STP-filtered `syn_value`, silently ignoring STP on sparse layout.
- **Medium** — STD/STP discrete jumps used pre-decay state (off-by-one); now use decayed `x^-, u^-` and facilitated `u^+` (Tsodyks–Markram).
- **Medium** — `ALIFBellec2020`/`LIF_SFA_Bellec2020` default adaptation init `OneInit(-50.)` -> `ZeroInit()`.

In-scope: 554 passed. Findings: `docs/issues-found-20260619-dynold.md`.

## Summary by Sourcery

Fix multiple regressions in legacy dynold short-term plasticity, sparse synapses, and Bellec neuron defaults, and add regression tests and documentation for the audited issues.

Bug Fixes:
- Correct STP state initialization so experimental STP instances construct and update properly with valid x/u states.
- Fix sparse Exponential and DualExponential synapse paths to call csrmv with the current API and to apply STP filtering on sparse conductances.
- Align STD/STP depression and facilitation jumps with the Tsodyks–Markram model by operating on decayed state at spike arrival instead of pre-decay variables.
- Update Bellec 2020 SFA neuron models so the adaptation variable starts at rest rather than at a large negative offset, avoiding spurious initial firing.

Enhancements:
- Adjust dynold Bellec adaptation defaults to use ZeroInit for the adaptation variable to reflect a physically reasonable resting state.

Documentation:
- Add an audit report documenting dynold issues found on 2026-06-19, their severity, rationale, and fix status.

Tests:
- Extend experimental synapse tests to cover sparse STP behaviour and ensure finite, correctly shaped sparse outputs.
- Refactor and extend experimental STP tests now that construction works, checking initialization and spike-driven state changes.
- Add dedicated STD/STP tests in synplast to pin correct Tsodyks–Markram jump behaviour using decayed local state.
- Add regression tests to ensure Bellec SFA neuron adaptation starts at rest by default.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b78d61b5b541`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.