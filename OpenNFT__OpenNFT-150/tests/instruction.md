# Issue

**Title:** Volume reader update

## Description

NEW:

- Siemens XA30 DICOM support (tested on phantom data in real-time simulation in auto rtQA mode)
- to enable support for Siemens XA30 DICOMs you need to switch flag `DICOM_SIEMENS_XA30` in config.py
- new unyfied function for volume reading in MATLAB (used in setupProcParams, setupFirstVolume and preprVol)

- a few cleaning and fixes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `44d3ef5768df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.