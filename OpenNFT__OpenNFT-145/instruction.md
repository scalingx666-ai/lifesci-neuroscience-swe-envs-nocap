# Issue

**Title:** Dicom read fix

## Description

CHANGES:

- handle changed Siemens 3D dicom export. Note that rt Siemens dicom format is changed in, e.g. IDEA XA30, and now the rt-export provides the 3D volume data, surprisingly read by Matlab 2020/21 dicomread() as 4D volumes. We handled this case as an extension, which may be further improved with IDEA progression. Note that dicom to nifti conversion could differently handle volume dimensions depending on the applied software, e.g. compare MRIConvert, nefti/dicomread(), and dicom import using SPM functions. Current setup implies that EPI template file is prepared using dicom import batch from SPM. The transition to entirely Matlab/Python solutions is feasible and foreseen in the nearest future.
- set nrROIs for orthview process
- config.py flags config.AUTO_RTQA and config.USE_RTQA

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5e0f77d86972`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.