# Issue

**Title:** spm_dicom_convert works with 3D MRSI data

## Description

Changes are implemented only around the conversion of the spectroscopy DICOMs.
It enables now conversion of 3D MRSI volumes generating 5D Niftis (readout, PE1, PE2, time (FID evolution), real/imaginary).

Tested on 7T Siemens data: B1 mapping, B0 mapping, MP2RAGE, PD-weighted, T1-weighted, and last but not least 3D MRSI. All conversions are identical to the version before this commit, bar the 3D MRSI, which previously yielded the error: 'Don't know how to handle these spectroscopy data'.

I have no single voxel spectroscopy (SVS) data to test it on, but I believe the code had a bug anyway and would crash with any spectroscopy data, as there was a variable "patient_to_tal", which was not specified anywhere (some legacy).

Additionally, indentations corrected (sorry, this makes it more difficult to review, I realised too late...)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e51910893f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.