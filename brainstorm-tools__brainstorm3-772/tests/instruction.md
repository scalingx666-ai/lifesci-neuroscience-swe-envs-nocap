# Issue

**Title:** Add PET volume import feature: GUI, core functions, and realignment

## Description

Added support for importing, pre-processing, and registering PET data in Brainstorm, including handling dynamic (multi-frame) PET volumes.

### GUI Update:
- Added an import option for PET in the subject menu.
- Grouped import menu items (MRI, CT, PET) under "Import Volumes" to reduce menu clutter.

### Core Functions:
- New mri_realign function to realign PET frames using SPM, with optional Gaussian smoothing.
- Modified import_mri to support importing and co-registration of dynamic PET volumes.
    - Automatic co-registration and reslicing of PET using SPM after the realignment step.

### User Prompts:
- Allows users to choose whether to align frames and apply smoothing during import.

### Future Work:
- Add support for bulk importing BIDS PET datasets.
- Integrate Freesurfer support for realigning and co-registering PET.

### Requirements and Assumptions:
- PET importing assumes that the corresponding MRI volume has already been imported into the Brainstorm protocol.
- SPM must be installed and configured within Brainstorm to enable PET frame realignment.

### Testing:
- Successfully tested locally using a Brainstorm protocol with .nii PET files.
- Test data available on request.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `74b14c6c1271`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.