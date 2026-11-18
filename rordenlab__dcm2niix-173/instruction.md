# Issue

**Title:** Improved support of Philips and GE features

## Description

- 
- 
- 
  - Uses proprietary GE Protocol Data Block (0025,101B).
  - Assumes raw text - reports exist of a [xml variant](https://groups.google.com/forum/#!msg/comp.protocols.dicom/mxnCkv8A-i4/W_uc6SxLwHQJ) 
 - Slice timing mimics dicm2nii. Assumes continuous acquisition (e.g. we do not know how to detect GE sparse acquisitions) and single-band (we do not know how to detect GE multi-band).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3751ee056f48`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.