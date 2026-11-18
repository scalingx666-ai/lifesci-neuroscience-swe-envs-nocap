# Issue

**Title:** ENH: Add PyTorch dependency to SlicerDMRI

## Description

The TractCloud module in SlicerDMRI now uses PyTorch for deep learning-based tractography parcellation. Adding PyTorch as a build dependency ensures the PyTorchUtils extension is installed for correct CUDA/CPU wheel selection.

Related PRs:
- SlicerDMRI/TractCloud#1 (inference CLI package)
- SlicerDMRI/SlicerDMRI#252 (TractCloud module refactor, merged)
- SlicerDMRI/SlicerDMRI#255 (review feedback: use PyTorchUtils)

Per @jamesobutler's review feedback on SlicerDMRI/SlicerDMRI#252.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `057a5e1e1dce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.