# Issue

**Title:** Add fMRI ROI query and selection options

## Description

## Summary
- Add query-based fMRI event selection.
- Add CIFTI ROI projection for Glasser cortical and subcortical regions.
- Avoid loading unused fMRI rows when applying ROI projections.

(resubmitted for correct ownership)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89f301bcb698`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.