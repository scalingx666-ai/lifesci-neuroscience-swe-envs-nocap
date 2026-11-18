# Issue

**Title:** Support ushort for the mgh/mgz reader

## Description

Hi,

nibabel currently crashes when loading an mgh/mgz file of type unsigned short.
As an consequence, recent FreeSurfer 7.4/8 clinical pipelines (that uses nibabel) now crashes on uint16 input MRIs (of any format, e.g nifti1) with an unfriendly python traceback, _because it can't read back the mgz it just converted its input to_.

I noted a bit of conflicting opinion on whether ushort should be supported for the MGH/MGZ file format.
- Nibabel's freesurfer explicitly (e.g test_mghformat.py:bad_dtype_mgh) forbids it for new object creation. And ANTs ITK-based tools refuse both to read and to write ushort mgz.
- But on the other hand, Freesurfer's own "mri_info" fully handle it, as so do other tools. In particular "mri_convert" obviously too (though not for explicit cast, ie. the -odt option!) considering FreeSurfer itself may create such ushort mgz out of well-supported regular ushort nifti files - without user's easily actionable workaround.

Therefore, officially supported or not, i suggest there is little drawback in nibabel not crashing when loading such ushort mgz.
The attached one-liner do that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db4c859fd148`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.