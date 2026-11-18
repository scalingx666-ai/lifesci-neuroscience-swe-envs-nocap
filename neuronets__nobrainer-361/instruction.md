# Issue

**Title:** feat: kwyk VWN layers verified against trained model + paper

## Description

## Summary

- Verified the original kwyk model architecture by inspecting trained weights from `neuronets/kwyk:latest-cpu` Docker container
- Cross-referenced with the paper (McClure et al. 2019, Section 2.2.3.2) and the original source code
- `FFGConv3d` now uses weight normalization (`v`, `g`) matching the actual trained model variable structure
- Added `ARCHITECTURE.md` documenting the full verification process

## Key Finding

The trained SSD model (`all_50_bvwn_multi_prior`) stores these variables per layer:
```
layer_N/conv3d/v        — raw weight for weight normalization
layer_N/conv3d/g        — gain per filter (kernel_m = g·v/||v||)
layer_N/conv3d/kernel_a — sigma (σ = |kernel_a|)
layer_N/conv3d/bias_m   — bias mean
layer_N/conv3d/bias_a   — bias sigma
layer_N/concrete_dropout/p — per-filter learned dropout rate
```

This confirms **weight normalization** (not direct μ) is used for the mean, while the paper's Eq. 18 KL applies to the effective μ = g·v/||v||.

## Changes

- `FFGConv3d`: weight normalization (v, g) + learned sigma + local reparameterization
- `ConcreteDropout3d`: per-filter KL with `prior_p=0.5` (Eq. 17)
- `warmstart_kwyk_from_deterministic()`: decomposes det weights into WN form
- `03_train_bayesian.py`: uses `kwyk_meshnet` model with `dropout_type` from config
- `ARCHITECTURE.md`: complete verification record

## Test plan

- [x] 17 unit tests for VWN layers + KWYKMeshNet (all pass)
- [x] 16 existing Bayesian layer tests (unchanged, all pass)
- [ ] CI pipeline

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `92029b7d4a8a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.