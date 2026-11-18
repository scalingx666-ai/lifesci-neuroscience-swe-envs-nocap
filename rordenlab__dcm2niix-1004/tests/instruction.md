# Issue

**Title:** DCM2NIIXFSLIB changes

## Description

1. freesurfer commit ee02fa4, Feb 04, 2026  
     () 
    - handle dicom files with space in the names when using dcm2niix for pre-processing    
      nii_dicom_batch.cpp/dcm2niix_fswrapper.cpp: output imagelist and series-info as csv
  2. freesurfer commit 6e75365, May 31, 2025 
     ()
     - Undo AutoScale Functor in dcm2niix conversion
       At the Martinos scanners, AutoScale functor scales data before saving them to DICOM. The scale factor is saved in DICOM tag (0020, 4000). Dcm2niix retrieves (0020, 4000) as image comments, and saves it in nifti header field aux_file. The string format is `Scale Factor: %f`.

       a. Retrieve the scale factors for each slice saved in dcm2niix - nii_dicom_batch.cpp::saveDcm2NiiCore().
       b. The scale factors are used to undo the scaling applied by AutoScale functor in Freesurfer.
  3. freesurfer commit 715964c, Mar 13, 2025 
      ()
      - fix packages/dcm2niix/nii_dicom_batch.cpp::dcmListDump()
        open MGH_DCMUNPACK_IMAGELIST to append once per call

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2fc09df2a3ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.