# Issue

**Title:** fix(dyn/neurons): CondNeuGroup synaptic-current scaling (1000x attenuation)

## Description

Fresh review of `brainpy/dyn/{neurons,channels,ions}`.

**High** — `CondNeuGroup` scaled incoming synaptic current by the membrane-area factor `1e-3/A`, a silent 1000x attenuation of synaptic drive whenever `A != 1e-3`. Synaptic input is already a current density and is now injected unscaled via the derivative (matching `CondNeuGroupLTC`); external injected current stays correctly density-converted.

Prior-audit channel/neuron findings (HH/Markov NaN at voltage singularity, etc.) were verified already-fixed. Regression tests added (263 passed in-scope). Findings: `docs/issues-found-20260619-dyn-neurons.md`.

## Summary by Sourcery

Fix synaptic current density scaling in CondNeuGroup and document neuron/channel audit findings.

Bug Fixes:
- Correct CondNeuGroup synaptic-current handling so synaptic inputs are treated as current densities and no longer attenuated by the membrane-area scaling factor.
- Ensure external injected currents in CondNeuGroup continue to be correctly converted from absolute current to current density.

Enhancements:
- Align CondNeuGroup synaptic handling semantics with CondNeuGroupLTC by injecting precomputed synaptic current density directly into the membrane potential derivative.

Documentation:
- Add an audit report documenting prior neuron/channel issues, their fix status, and remaining low-priority findings in the dyn neurons/channels/ions modules.

Tests:
- Add regression tests verifying CondNeuGroup synaptic current scaling matches CondNeuGroupLTC and that external input scaling remains correct.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03affbf43920`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.