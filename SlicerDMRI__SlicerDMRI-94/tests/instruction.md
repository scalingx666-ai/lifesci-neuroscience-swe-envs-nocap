# Issue

**Title:** WIP: refactor vtkMRMLFiberBundleNode (2/2)

## Description

Fixes interactive sub-sampling and continuous ROI selection.
Fixes de-selecting ROI node.
Improves performance by hiding filter output behind passthrough.
Cleans up cruft.

- [x] re-fix single-shot extract-from-ROI
- [x] rename `Interactive ROI` to  `Interactive ROI Update`
- [x] fix interactive sub-sampling

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e733934b9f56`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.