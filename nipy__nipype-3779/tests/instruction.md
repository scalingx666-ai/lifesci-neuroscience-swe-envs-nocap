# Issue

**Title:** FIX: Pass -R before reference_image in ComposeMultiTransform

## Description

`ComposeMultiTransform.reference_image` now renders as `-R <image>`, which is the form the ANTs executable expects. Previously the bare path was emitted and silently ignored. .

<details>
<summary>Verification</summary>

Run against ANTs 2.6.5 (`ANTs Version: 2.6.5.post187-g0202eb6`):

```
ComposeMultiTransform 3 composed_R.nii.gz -R fixed.nii.gz out1_0GenericAffine.mat
reference_image_filename: fixed.nii.gz
```

Before the fix, the same inputs produced `ComposeMultiTransform 3 composed.mat fixed.nii.gz out1_0GenericAffine.mat` and ANTs reported "the reference affine file for center is selected as the first affine", i.e. the reference image was dropped.

Doctests for `nipype/interfaces/ants/utils.py` and the regenerated `test_auto_ComposeMultiTransform.py` pass; `pre-commit run --all-files` is clean.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `599a76208500`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.