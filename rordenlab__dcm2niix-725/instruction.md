# Issue

**Title:** Dev fix TotalReadoutTime for GE with interpolation

## Description

This is a fix for correcting TotalReadoutTime and EffectiveEchoSpacing in the BIDS (.json) sidecar in case of image interpolation.

TotalReadoutTime and EffectiveEchoSpacing were correct when there was no interpolation (i.e. AcquisitionMatrixPE = ReconMatrixPE). However, when interpolation was used, this values were incorrect. When interpolation was used, the estimated fieldmap given by TOPUP was ReconMatrixPE/AcquisitionMatrixPE times a measured fieldmap. Also, the same interpolated images corrected with a B0Map based method via FSL's epi_reg were clearly under-corrected.
It turned out that the problem was coming from TotalReadoutTime and EffectiveEchoSpacing which were not taking ReconMatrixPE correctly into account.
This is a Fix for that.

GE/README.md was modified to clarified how TotalReadoutTime and EffectiveEchoSpacing are now computed.
Some intermediate variable were also introduced and described. This should help the final user to better understand.

console/nii_dicom_batch.cpp was modified to implement the changes on TotalReadoutTime and EffectiveEchoSpacing.
The intermediate variables described in README were also added into the json BIDS sidecar (i.e. EchoSpacingMicroSecondsGE, NotPhysicalNumberOfAcquiredPELinesGE, NotPhysicalTotalReadOutTimeGE). As the TotalReadoutTime definition is not intuitive this should help the user to understand what is going on.

On branch dev-fix-TotalReadoutTimeGE-with-interpolation Changes to be committed:
	modified:   GE/README.md
	modified:   console/nii_dicom_batch.cpp

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `14c66a1fd2a8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.