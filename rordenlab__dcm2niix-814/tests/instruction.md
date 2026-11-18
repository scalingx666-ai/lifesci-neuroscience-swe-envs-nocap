# Issue

**Title:** Disable XA partial vol detection for single slice files

## Description

The original check for partial Siemens XA volumes assumed that if (0021, 118e) (ICE_Dims_long) has a value then the DICOM file is in enhanced format, e.g. 1 volume per file. However, Siemens XA frequently exports in "classic" mode (1 slice per file) or gets unenhanced en route, so although files with just 1 slice are partial volumes, it does not necessarily mean any slices are missing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae1cb2917de7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.