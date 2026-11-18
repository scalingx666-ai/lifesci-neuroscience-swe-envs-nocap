# Issue

**Title:** DCM2NIIXFSLIB changes

## Description

- dcm2niix_fswrapper: allow subset of dcm2niix options to be set through mri_convert
  - dcmListDump(): use environment variable MGH_DCMUNPACK_IMAGELIST to communicate with dcm2niix where to output imagelist.dat
  - retrieve/output 'pulseSequenceDetails (tSequenceFileName)' from DICOM CSA header (0029,1020)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `66f64274e7e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.