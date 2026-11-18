# Issue

**Title:** Scaling issue

## Description

When Nibabel reads in nifti data, it reads as float64 regardless of its actual type (but if you check the header, it’s the correct original type). When save output image, if directly use Nibabel data (float64) and header from input (int16), due to type conflict (float is larger), output will have scaling factor saved in header. To fix the issue, use: nifti_out = nib.Nifti1Image(np.round(nifti_out).astype(np.int16), affine, header)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f5155ec755c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.