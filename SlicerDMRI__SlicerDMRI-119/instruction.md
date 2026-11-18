# Issue

**Title:** Dicom TR improvements

## Description

Changes to support pointwise, along-track measurements ("TrcMeasurement" in DCMTK terminology)

Requires the following DCMTK branch with a few fixes:

https://github.com/SlicerDMRI/DCMTK/commits/ihn-patched2

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `30fc543e2786`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.