# Issue

**Title:** Keep zero convolutional and local kernels finite during normalization

## Description

Zero kernels in `Conv1dConnection`, `Conv2dConnection`, `Conv3dConnection` and the corresponding dimensional `LocalConnection` classes become NaN during normalization: the weight sum is zero, so the in-place multiplication evaluates `0 * (norm / 0)`. A zero normalization target also causes this on subsequent calls after it has zeroed nonzero weights.

Use denominator 1 only for genuinely all-zero kernel groups, keeping those weights zero. Each nonzero group's existing signed-sum normalization is retained; a nonzero signed kernel whose values cancel is not silently treated as an empty kernel. The six method docstrings and Unreleased changelog describe zero-kernel handling. No extra weight parameters or dependencies are introduced.

Forty-two cases cover all six classes, float32/float64 normalization, disabled/zero/positive targets, mixed zero and nonzero groups, repeated calls, parameter identity, float32 public pre-activation computations and nonzero signed-cancellation controls. Unchanged master fails 24 cases and passes 18 controls.

## Validation

Windows CPU / Python 3.12.14 / torch 2.14.0+cpu / torchvision 0.29.0+cpu:

- Final full pytest suite: **234 passed, 1 skipped, 8 warnings**.
- Sparse tensor invariant checks were enabled throughout the full run; the 2 GiB available-memory guard did not trigger.
- Project-wide isort/Black checks through Poetry/pre-commit and Git diff checks pass.

GPU execution and a full documentation build were not run. CPU torch/torchvision and formatting tool versions follow the same verified project pins/profile reported in #813. No lockfile, dependency, workflow or sparse-check settings are changed. This PR targets master independently of #813.

Prepared and tested autonomously with OpenAI Codex. The account owner has not independently reviewed this patch before submission; no human-only authorship or review is claimed.

Local integration check: #813 and #814 apply together without conflicts, including both changelog entries. The full suite passes with **254 passed, 1 skipped, 8 warnings**, sparse tensor invariant checks enabled, and the memory guard not triggered. Project-wide pre-commit checks also pass. The private integration branch was not pushed; each PR keeps its independent master base.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3465382e959c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.