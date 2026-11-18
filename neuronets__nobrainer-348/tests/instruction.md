# Issue

**Title:** docs: replace TF tutorials with PyTorch guide scripts

## Description

## Summary

- Replace the old TF-based tutorial (`api_train_generation_progressive.py`) with four new PyTorch tutorials in jupytext percent format
- All scripts tested and run successfully on CPU

## Tutorials

| Script | Content |
|--------|---------|
| `01_getting_started.py` | Model instantiation, predict(), listing all available models |
| `02_train_segmentation.py` | Train UNet on synthetic sphere data, evaluate Dice (achieves 0.96) |
| `03_bayesian_uncertainty.py` | BayesianVNet MC inference, variance/entropy maps (Dice 0.97) |
| `04_brain_generation.py` | ProgressiveGAN training with PyTorch Lightning |

## Test plan

- [x] All 4 scripts run to completion on CPU without errors
- [x] Pre-commit (black, flake8, isort, codespell) passes

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3db5a0ba6e46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.