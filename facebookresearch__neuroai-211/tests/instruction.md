# Issue

**Title:** Add fMRI ROI query/selection options and small fixes.

## Description

## Summary
- Add query-based fMRI event selection.
- Add CIFTI ROI projection for Glasser cortical and subcortical regions.
- Avoid loading unused fMRI rows when applying ROI projections.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86846e2f4988`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.