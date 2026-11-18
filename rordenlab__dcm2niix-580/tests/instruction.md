# Issue

**Title:** Add support to NeuroJSON (.jnii and .bnii) files (cleaned)

## Description

Here is the resubmission of #579 after cleaning the commit history using cherry-pick, as suggested by @ningfei

---------------------
Dear Chris (@neurolabusc), I would like to submit a patch to enable `dcm2niix` to export to NeuroJSON (http://neurojson.org) NIfTI JSON wrappers, including

- `.jnii` - lightweight JSON wrapper to NIfTI (text-based JNIfTI, see [current specification](https://github.com/NeuroJSON/jnifti/blob/master/JNIfTI_specification.md))
- `.bnii` - [binary JSON](https://github.com/NeuroJSON/bjdata/blob/master/Binary_JData_Specification.md) (yet still human-readable) wrapper to NIfTI for disk/IO efficiency

The patch is fairly straightforward, including two added flags: `-e j` for exporting to `.jnii` and `-e b` for exporting to `.bnii`. Both flags are compression-aware: when `-z y` is given, the data segment of .jnii/.bnii will be compressed based on the compression level. In this patch, I only added a few functions (`nii_savejnii`, `nii_savebnii`) in the `nii_dicom_batch.cpp` unit and two additional helper units `cJSON.c/h` and `base64.c/h`, both of which have been copied from your [nii2mesh code tree](https://github.com/neurolabusc/nii2mesh/tree/main/src). The added codes should have no impact to any of the existing features.

The updated code has [passed](https://github.com/fangq/dcm2niix/runs/5132341414) the Travis-CI automated tests, and I have also run `valgrind` to make sure there is no memory leakage. I also formatted the new functions to use the same tab-based indentation styles.

The bottom screenshot summarizes some of the tests I did, making sure the generated files are readily readable by my [Python](https://pypi.org/project/jdata/) and [MATLAB](https://github.com/NeuroJSON/jsonlab) parsers. It also demonstrate additional benefits enabled by this format - including file sizes, header searchability (without decompressing files) and readability.

I hope you can take a look at this patch and let me know if it can be accepted. I am committed to supporting this feature moving forward. Look forward to hearing from you!


![jnifti_patch_demo](https://user-images.githubusercontent.com/226913/153297354-acb9b3cc-e1f2-43dd-a3d5-b0fab107307a.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `822a4e12c1f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.