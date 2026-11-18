# Issue

**Title:** fix(dyn): PoissonGroup never spikes due to boolean rand_like dtype

## Description

## Problem

`PoissonGroup` never emitted spikes. In `PoissonGroup.update`, the random draw used
`rand_like(self.spike.value)`. Since `spike` is boolean-typed and `rand_like` inherits the
input dtype, the draw was boolean (≈ all `True`), so the comparison `True <= prob` was always
`False` and the group never fired.

Because both `examples/dynamics_simulation/decision_making_network.py` and
`examples/dynamics_simulation/stdp.py` are driven entirely by `PoissonGroup`, the decision
network was silent (0 Hz in every population) and STDP weights stayed frozen.

## Fix

Force a real uniform draw with `dtype=float`:

```python
spikes = bm.random.rand_like(self.spike.value, dtype=float) <= (self.freqs * share['dt'] / 1000.)
```

## Tests

The existing `test_PoissonGroup` only asserted output *shape*, which is why the regression
slipped through. Added:

- `test_PoissonGroup_fires_at_expected_rate` — asserts empirical rate ≈ `freqs` (0 Hz on old code).
- `test_PoissonGroup_fires_in_batching_mode` — covers batched shape preservation + rate.

## Verification

- `input_test.py` + `STDP_test.py`: 139 passed.
- Decision network: Group A wins at 41.8 Hz (persistent delay activity), Group B suppressed to 0.4 Hz.
- STDP: `max|ΔW|` over 10 s = 0.0032 (weights now evolve).

## Summary by Sourcery

Ensure PoissonGroup emits spikes by fixing its random draw dtype and strengthen tests to verify firing rates, including in batching mode.

Bug Fixes:
- Fix PoissonGroup spike generation by forcing uniform random draws to use a floating-point dtype instead of inheriting the boolean spike dtype.

Tests:
- Add tests asserting PoissonGroup fires at the expected rate over time.
- Add a batching-mode PoissonGroup test verifying both batched spike shape and firing rate.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b6b5cc5e29ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.