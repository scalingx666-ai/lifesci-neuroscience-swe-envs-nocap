# Issue

**Title:** fix: force download from our github repo

## Description

Hotfix for #441 
Forcing download from fallback_urls which are in correct orientation

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->

## Summary by CodeRabbit

- Bug Fixes
  - Switched installer to reliably use fallback download URLs to prevent failed primary downloads.
  - Ensures all four required assets are fetched consistently; installation now exits cleanly on any failed download.

- Chores
  - Simplified download flow by removing the primary-source loop and post-download gzipping, reducing install complexity and time.
  - Standardized output filenames (average.nii.gz, labels.nii.gz, mask.nii.gz, R_mapping.csv) for downstream steps.
  - Left other asset downloads (e.g., Zenodo) unchanged.

<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc33342c47c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.