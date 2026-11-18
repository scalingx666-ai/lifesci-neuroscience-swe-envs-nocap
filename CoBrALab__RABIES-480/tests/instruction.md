# Issue

**Title:** Labels at analysis

## Description

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->
## Summary by CodeRabbit

* **New Features**
  * Added explicit ROI_labels_file option; ROI label files are validated, converted to RAS when needed, and resampled for downstream use.

* **Refactor**
  * Removed label outputs from preprocessing, resampling, QC, and confound workflows; label handling centralized to atlas/ROI file flow.
  * CLI reorganized to expose commonspace/template options and remove per-atlas label arguments.
  * QC visuals simplified to a 3x5 mask grid.

* **Bug Fixes**
  * Improved validation and clearer errors when ROI label files are missing or mismatched.
<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `896db45408b1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.