# Issue

**Title:** ENH: nibabel support

## Description

Long overdue  

Using recent additions to deal with shear in sform transforms, I added methods to convert to and from nibabel format. 

The method proposed in #698 was to use the qform, which guarantees an orthonormal basis. However, this is contrary to many user's expectations. Instead, I use the image "affine" property, which can either be qform or sform. If there is no shear, then it's used as-is, and if not, it can be "de-sheared" up to a user-defined maximum deviation from the original axes.

Going the other way, we can set the affine based on the ITK direction, spacing, origin. If this differs from the original affine, nibabel will reset qform / sform codes accordingly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `156646ec4445`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.