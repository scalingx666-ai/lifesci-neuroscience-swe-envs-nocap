# Issue

**Title:** Make loss weight masking conditional on loss function support

## Description

## Summary
This PR refactors the deep supervision loss computation to conditionally apply per-voxel weight masks only to loss functions that explicitly support them, rather than unconditionally passing weight masks to all loss functions.

## Key Changes
- Added `_loss_supports_weight()` utility function that uses introspection to check if a loss function's `forward` method accepts a `weight` parameter
- Updated three loss computation methods to conditionally apply foreground-weighted masks:
  - `compute_multitask_loss()`
  - `compute_loss_for_scale()`
  - `compute_standard_loss()`
- Loss functions that support weight masks (e.g., WeightedMSELoss, WeightedMAELoss, SmoothL1Loss) receive the mask
- Loss functions that don't support weight masks (e.g., MONAI DiceLoss, BCEWithLogitsLoss) are called without the weight argument

## Implementation Details
- The `_loss_supports_weight()` function uses `inspect.signature()` to safely check the loss function's forward method signature
- Gracefully handles inspection errors by returning `False` as a fallback
- Foreground weighting (2.0x for SDT > 0) is only computed when needed, reducing unnecessary tensor operations
- This approach maintains backward compatibility while enabling use of diverse loss functions in the same training pipeline

https://claude.ai/code/session_01XRs3k4q3869VksCMeHsMTN

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70df51538f01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.