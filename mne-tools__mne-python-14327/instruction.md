# Issue

**Title:** ENH: Support Array API inputs in ReceptiveField with compatible estimators

## Description

#### Reference issue

.

#### What does this implement/fix?
This adds experimental Array API support to ReceptiveField when used with a compatible external estimator, such as scikit-learn’s Ridge(solver="svd").
Delay construction, fitting, prediction, inverse patterns, and per-output scoring support backend-native arrays on their device. The default FFT-based TimeDelayingRidge solver still requires NumPy.
The implementation uses a small shared namespace/device helper with optional array-api-compat. There are no new mandatory dependencies or public API parameters.

The revision also:
- Enables sklearn’s generic Array API checks through the estimator tags, with a test-only adapter for MNE’s per-output scores.
- Keeps MNE-specific coverage for epoch/lag ordering, patterns, and unintended host conversion.
- Fixes multi-output inverse-pattern axis ordering and preserves residual covariance centering, with analytic regression tests.
- Simplifies delayed-feature reshaping while preserving the previous NumPy memory layout.
- Adds user-facing Array API documentation and an opt-in test step within the existing Ubuntu CI job.

A backend-native correlation statistic is retained because SciPy’s PyTorch pearsonr path requires host conversion.
The small DLPack conversion is retained for a reproducible mixed-backend target-input case.

#### Local validation
- Receptive-field tests with Array API enabled: 129 passed, 16 skipped.
Skipped tests are not counted as validated coverage. CUDA/CuPy execution remains untested. No general training-speed or GPU-performance improvement is claimed.

#### AI assistance
OpenAI Codex assisted with implementation, tests, documentation, CI configuration, and automated review.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f7c06df9360`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.