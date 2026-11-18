# Issue

**Title:** bf: Fix tensorflow macos arm compatability

## Description

Fixes issues with some of the tensorflow based tools when running on an arm based macos machine (M1, M2, M3 chipset). The two main issues are:

	1. a check for np.float128 which isn't a supported datatype on this chipset
	2. an error in the shape of tensors provided to batch- normalisation layers

Issue 1 can be fixed by removing the check as it's not likely to be necessary in most cases.

Issue 2 arrises as there are two implementations of batch norm in keras (fused/unfused). Tensors of rank 5 are not supported in the faster fused version, so a check is performed based on the input shape and the correct version should be selected. For some reason this check isn't working on the macOS arm chipsets (possibly a tensorflow-metal or keras version issue) and this causes the shape mismatch at inference.

Checking behaviour on an Ubuntu installation the batch norm does seem to default to the non-fused version so explicitly setting fused=False at network construction should avoid the issue altogether.

This commit applies the fix to mri_synthseg, mri_synthsr and mri_segment_thalamic_nuclei_dti_cnn but the issue is likely still present in other tensorflow based tools.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba7e7dc05d56`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.