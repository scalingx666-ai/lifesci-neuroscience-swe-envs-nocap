# Issue

**Title:** Specific debugs and update local settings

## Description

- Debug: 
  - extract bvals/bvecs from DICOM for GE diffusion 
  - update aamod_listspikes according to 'new' tsdiffana
- Update settings for RHUL and UEA

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e90bde765ef9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.