# Issue

**Title:** BF: handle empty BrainModelAxis masks and selections

## Description

.

An all-false mask or a selection that removes every greyordinate cannot currently produce a BrainModelAxis: its surface/volume mask properties call np.vectorize without an output type, which raises on empty input.

Specify the boolean output type for both mask properties and let iter_structures finish without indexing the first element when the axis is empty. Tests cover surface and volume masks, an empty slice, an all-false selection, and concatenating the empty result with a non-empty axis.

Validation: all four new cases fail on the base. The CIFTI-2 suite passes 114 tests with 16 optional-data skips and one expected failure. Ruff 0.15.15 lint and formatting pass for both changed files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `edf28398253e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.