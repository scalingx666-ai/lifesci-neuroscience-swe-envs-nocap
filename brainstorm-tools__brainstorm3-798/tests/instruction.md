# Issue

**Title:** Add PET volume processing: SUVR, ROI masking, projection to surface, SPM-petpve plugin

## Description

PET processing functionalities, extending the previously integrated PET import pipeline.

###  Features:
  - Atlas-based ROI masking, using existing '_volatlas' files in Brainstorm
  - Intensity rescaling (SUVR)
  - Volume-to-surface projection
  - GUI/dialog for collecting user input for PET processing
  - PETPVE plugin as an SPM toolbox

### New functions: 
  - `process_pet.m`: scriptable entry point for PET processing - used to chain together PET processing functions 
  -  `panel_process_pet.m`: GUI for collecting user input for PET processing - works with `process_pet.m`
  - `mri_rescale.m`: rescale intensity values (e.g. SUV/SUVR) using the mean value of a reference regions - works with `panel_process_pet.m` and `mri_mask.m`
  - `mri_mask.m`: bilateral ROI-based volume masking using atlas labels from supported atlases: "aseg", "Desikan-Killiany" and so on. 
  - `mri_interp_vol2tess.m`: interpolates 3D PET volumes onto cortical surfaces

Please let me know if further modularization or code cleanup is needed. Thanks for reviewing!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4983e2f0fe18`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.