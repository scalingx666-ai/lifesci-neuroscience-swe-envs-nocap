# Issue

**Title:** Fix code and doc for GE TotalReadoutTime

## Description

Fix typos in GE/README.md and code mofification to add the intermediate variables for TotalReadoutTime on GE system in debug mode only (via compilation flag MY_DEBUG).

Added a note for that in GE/README.md:

For debugging purposes, the intermediate variables `NotPhysicalTotalReadOutTimeGE`, `NotPhysicalNumberOfAcquiredPELinesGE` and `EchoSpacing` (renamed `EchoSpacingMicroSecondsGE`) are written to the BIDS-sidecar JSON file when dcm2niix is compiled with the flag `MY_DEBUG`.

On branch dev-fix-GETotalReadoutTime-doc-and-code
Changes to be committed:
	modified:   GE/README.md
	modified:   console/nii_dicom_batch.cpp

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d16c6e63c73`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.