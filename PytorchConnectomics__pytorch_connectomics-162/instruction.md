# Issue

**Title:** feat: Add 2D data processing support with do_2d flag

## Description

- Add do_2d parameter to DataConfig and InferenceDataConfig
- Modify MonaiConnectomicsDataset to handle 2D dimensions when do_2d=True
- Update model wrapper to squeeze/unsqueeze depth dimension for 2D models
- Disable sliding window inference for 2D models, use direct inference
- Make TTA flip axes dynamic based on data dimensions (2D vs 3D)
- Switch evaluation metric from Jaccard to Adapted Rand Error for instance segmentation
- Update monai2d_worm.yaml config to enable 2D processing

This enables seamless 2D data processing while maintaining 3D compatibility.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c687f4c0f0f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.