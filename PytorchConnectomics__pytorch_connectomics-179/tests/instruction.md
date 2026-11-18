# Issue

**Title:** Fixes neurons and axons examples

## Description

# Fixes and Updates for Neurons and Axons Examples

## Summary
Improvements to neuron/axon segmentation: enhanced multi-task learning, 2D data support, improved Optuna tuning, and numerical stability fixes.

## Key Changes

### Core Framework
- **Dataset**: Fixed `MonaiCachedConnectomicsDataset.__len__()` to handle partial caching correctly (prevents IndexError with `cache_rate < 1.0`)
- **Optuna Tuner**: Added 2D data support with automatic dimension expansion, fixed OmegaConf attribute access
- **Lightning Training**: Added deep supervision clamping (±15.0) to prevent NaN losses, improved multi-task loss handling with tanh activation support

### Configuration Updates
- **Zebrafish Neurons**: 
  - Expanded to 3-channel output (binary + boundary + EDT)
  - Optimized loss weights and added tanh activation for EDT
  - Improved optimizer settings (lr: 0.001→0.0005, patience: 30→25)
  - Added comprehensive Optuna tuning configuration
  
- **MONAI Tsai Axons**: Updated paths, improved validation monitoring, restructured postprocessing

### Other
- Updated installation scripts and justfile commands
- Minor fixes in main.py for better error handling

## Impact
- Better small object segmentation with improved loss weighting
- Enhanced numerical stability preventing training crashes
- Robust 2D data handling in Optuna tuner
- Production-ready configurations for cluster deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `627fecdeff48`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.