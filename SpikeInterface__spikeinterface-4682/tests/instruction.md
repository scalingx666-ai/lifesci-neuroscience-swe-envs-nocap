# Issue

**Title:** Fix Llobet expected-violations formula in sliding RP metric

## Description

## Fix Llobet expected-violations formula in the sliding RP metric

`_compute_violations` computed expected violations as `Ve = 2·τ/D · Nc·N` (i.e. `Nc·(Nb + Nc)`), which overestimates `Ve` and inflates the contamination confidence. Corrected to the Llobet et al. (2022) form used by the reference implementation:

```
Ve = 2·τ/D · Nc·(Nb + (Nc − 1)/2)     Nc = C·N,  Nb = (1 − C)·N,  D = N / firing_rate
```

Also extends the default contamination grid to include 35 % (`np.arange(0.5, 35.5, 0.5)`, previously stopped at 34.5 %) and adds a unit test for `_compute_violations` against the analytical formula.

Reference: https://github.com/SteinmetzLab/slidingRefractory (`metrics.computeViol`).

### Known non-equivalences (out of scope)
The metric definition now matches the reference, but results are not bit-identical because SI (by existing design) uses a coarser ACG bin size (`bin_size_ms=0.25` vs sample-resolution) and a different correlogram engine (`_compute_correlograms_*` vs the reference `histdiff`-equivalent). Full numerical parity would be a separate change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c33abf56fc81`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.