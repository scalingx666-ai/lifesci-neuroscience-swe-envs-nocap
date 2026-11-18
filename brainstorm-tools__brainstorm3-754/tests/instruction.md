# Issue

**Title:** Functions for MRI/CT skull stripping

## Description

While importing CT ~and co-registering using  SPM or CT2MRI~, give option for skull stripping either using **BrainSuite (Brain Surface Extractor)** or **SPM (Tissue segmentation)**

![Screenshot 2024-11-27 213247](https://github.com/user-attachments/assets/9d7d939d-a026-48c9-949b-319614914b8e)


EDIT: @rcassani 

In additon:
* Add popmenu callbacks to perform registration with BrainSuite
* Add popmenu callbacks to perform skull stripping (with SPM or BrainSuite)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a05accdd4109`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.