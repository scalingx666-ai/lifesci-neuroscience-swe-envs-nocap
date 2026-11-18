# Issue

**Title:** minor bug fix atlas_gen/mesh_utils

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
When I started with implemeneting tests for `atlas_gen/mesh_utils.py` I encountered a minor bug and a `DeprecationWarning`.
- `extract_mesh_from_mask` does not handle binary masks with only 0s or only 1s
- `extract_mesh_from_mask` `DeprecationWarning: Please import `binary_fill_holes` from the `scipy.ndimage` namespace; the `scipy.ndimage.morphology` namespace is deprecated and will be removed in SciPy 2.0.0.`

**What does this PR do?**
- modify`extract_mesh_from_mask` to accept masks with only 0s or only 1s.
- import `binary_closing`, `binary_fill_holes` from `scipy.ndimage` to avoid Deprecation.

## References
#541  points 6 and 7

## How has this PR been tested?
Tests will be added in seperate PR. Codecov reports can be ignored for this PR.

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1602833d6421`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.