# Issue

**Title:** Cellmap pull request from Ethan Shen

## Description

- Add data type conversion (_prepare_images/_prepare_labels) to prevent uint8/float16 mismatch
- Implement CellMapBalancedLoss with comprehensive NaN/inf handling for sparse segmentation
- Add batch skipping for empty batches to prevent NaN contamination in progress bars
- Replace problematic pos_weight computation with uniform weights to avoid numerical instability
- Add limit_train_batches/limit_val_batches to prevent infinite epochs from large datasets
- Enhance loss function with gradient-connected safety values and extensive numerical stability checks

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f34f6aca9257`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.