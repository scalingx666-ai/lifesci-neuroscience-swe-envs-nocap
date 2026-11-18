# Issue

**Title:** fix(validation): perturbation precision fixes and vis nvm probe

## Description

## Summary

- **Near-constant tensor perturbation**: Changed exact `lo == hi` check to relative threshold `hi - lo < max(1e-6, abs(lo) * 1e-6)` — near-constant float tensors (range < float32 precision) now get proper range expansion. Fixes `test_ssd300_vgg16_train`.
- **Perturbation exemptions**: Added exemptions for `maximum`/`minimum`, C++ ops (`_op`), `exponential_`, and scaled perturbation range for large constants.
- **Perturbation precision**: Fixed precision issues when perturbing tensors with large magnitudes.
- **Vis nvm probe**: `elk_available()` now probes `~/.nvm` paths when `node` is not on PATH, fixing ELK layout in non-interactive shells (IDE test runners, CI).

## Test plan
- [x] `test_ssd300_vgg16_train` passes
- [x] All 59 validation tests pass
- [x] All 18 smoke tests pass

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b040b6d459d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.