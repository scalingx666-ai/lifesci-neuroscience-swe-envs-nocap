# Issue

**Title:** fix(kionex): add missing local self-excitation term J*r*(E-V) to dV/dt

## Description

## Summary

The `KIonEx` drift for `V` omitted the local **within-node** synaptic self-excitation `J*r*(E-V)` that appears in the model paper (Bandyopadhyay & Rabuffo et al. 2023) and in the model's own docstring. Because the structural connectivity has a zero diagonal, that term cannot arrive through the coupling matrix, so it has to be added explicitly.

Applied to all three drift definitions that must stay consistent:

- `KIonEx.state_variable_dfuns['V']` (numba/hybrid codegen source)
- `KIonEx._numpy_dfun` (reference implementation)
- `_numba_dfun` (njit kernel)

## Test

Adds `test_kionex_local_self_excitation_term`, a discriminating regression test: `Jr(E-V)` is the only place `J` appears in `dV/dt` and is independent of `Coupling_Term`, so changing `J` must change `dV/dt` by exactly `(J2-J1)*r*(E-V)`. On the pre-fix code `J` does not enter `dV/dt` at all, the difference is zero, and the assertion fails. It also checks the numba path, the codegen string, and numpy/numba agreement, and asserts the test configuration is non-degenerate.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe9e4d4c65b5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.