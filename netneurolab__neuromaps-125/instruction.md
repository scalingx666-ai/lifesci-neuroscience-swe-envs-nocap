# Issue

**Title:** [FIX] raise error when parcellating volumetric data defined as array

## Description

Input data to be parcellated can be array-like but the neuromaps Parcellater will assume it's surface data.
I've modified the code such that an error is thrown when MNI152 data is provided as an `np.ndarray`. Volumetric data should instead be provided as a Nifti1Image. We don't convert the array to a Nifti1Image because the affine should be defined too. This PR was prompted by issue #122

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07b03f066542`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.