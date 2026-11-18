# Issue

**Title:** DCM2NIIXFSLIB changes

## Description

1. freesurfer commit f34ac43, Feb 05, 2025 
      - support single dicom file conversion
  2. freesurfer commit 02f92cc, Apr 02, 2024
     - save bvals/bvecs for B=0 series in mrifsStruct
  3. freesurfer commit f81e10c, Apr 02, 2024 
     - add optional 'bool convert' parameter to dcm2niix_fswrapper::dcm2NiiOneSeries() if 'convert=false', retrieve dicom info only 
     - add dcm2niix_fswrapper::clrMrifsStruct() to interface nii_dicom_batch.cpp::nii_clrMrifsStruct() 
     - add dcm2niix_fswrapper::clrMrifsStructVector() to interface nii_dicom_batch.cpp::nii_clrMrifsStructVector() 
     - fix nii_dicom_batch.cpp::dcmListDump() to not accidentally close stdout

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d295ff5e9f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.