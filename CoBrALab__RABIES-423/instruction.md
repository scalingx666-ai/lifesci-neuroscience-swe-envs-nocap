# Issue

**Title:** Ci/apptainer on release

## Description

- fix ROI_csv path #406 
- feature: apptainer image now attaches on release #325 
testing on my fork
[release](https://github.com/CMonnin/RABIES/releases/tag/0.1.1-alpha-e)
[action](https://github.com/CMonnin/RABIES/actions/runs/15146083906)
- refactor: added back in links to download from [mouseimaging.ca](https://www.mouseimaging.ca/repo/DSURQE_40micron/Dorr_2008_Steadman_2013_Ullmann_2013_Richards_2011_Qiu_2016_Egan_2015_40micron/nifti/)  
- now the .nii files rather than the mnc



<!-- This is an auto-generated comment: release notes by coderabbit.ai -->
## Summary by CodeRabbit

* **New Features**
  * Added automated workflow to build and attach Apptainer images to releases.

* **Bug Fixes**
  * Improved DSURQE template installation script with a fallback download mechanism and enhanced error handling.

* **Other Changes**
  * Updated default value for an analysis argument to use a CSV file instead of a NIfTI file.
<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `749597343b3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.