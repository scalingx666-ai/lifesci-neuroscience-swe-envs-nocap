# Issue

**Title:** GE Diffusion SliceTiming

## Description

- Improved GE software version reading (version 30) #634 
- Added SliceTiming for GE Diffusion #635 
- New keys added in JSON for GE diffusion:
> NumberOfDiffusionDirectionGE
> NumberOfDiffusionT2GE
> TensorFileNumberGE
> DiffGradientCyclingGE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f7f376af57a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.