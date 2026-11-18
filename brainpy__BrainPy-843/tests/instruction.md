# Issue

**Title:** fix(dnn): BatchNorm running-var bias, pooling channel_axis, LayerNorm error

## Description

Fresh review of `brainpy/dnn`. Three Medium fixes:

- **BatchNorm** stored the *biased* batch variance into `running_var`; now applies Bessel's `N/(N-1)` correction for the running buffer (PyTorch-consistent), keeping biased variance for in-batch normalization.
- **Pooling** rejected the leftmost negative `channel_axis` (`== -x_dim`) due to an `abs()` bound; widened to `-x_dim <= axis < x_dim` (Pool, _MaxPoolNd, AdaptivePool).
- **LayerNorm** wrong-shape error did `', '.join(<ints>)` -> `TypeError` masking the intended `ValueError`.

Prior-audit GroupNorm/InstanceNorm + affine-norm findings verified already-fixed. Regression tests added (589 passed in-scope). Findings: `docs/issues-found-20260619-dnn.md`.

## Summary by Sourcery

Fix dnn normalization and pooling edge-case bugs and document the audit findings for these modules.

Bug Fixes:
- Ensure LayerNorm raises a clear ValueError with a correct expected-shape message when the input trailing dimensions mismatch normalized_shape.
- Update BatchNorm to use an unbiased (Bessel-corrected) variance estimate for the running_var buffer while preserving biased variance for in-batch normalization.
- Allow pooling layers to accept the leftmost negative channel_axis (== -x_dim) by using a symmetric axis bounds check instead of abs().

Documentation:
- Add an issues-found report documenting the dnn module audit, identified problems, and their resolution status.

Tests:
- Add regression tests covering LayerNorm shape-mismatch errors, BatchNorm running_var unbiasedness and batch normalization behavior, and pooling with leftmost negative channel_axis.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ee61019421b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.