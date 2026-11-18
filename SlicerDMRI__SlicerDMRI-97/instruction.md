# Issue

**Title:** Add DWI DICOM plugin

## Description

Add DICOMDiffusionVolumePlugin which was removed from Slicer core, with a few small enhancements:
- check Modality tag == 'MR'
- return more useful help text on failure (via `loadType` -- kind of a hack but does what I want)
- increase plugin confidence on match (we had reduced confidence to avoid conflicts with other plugins, but now this is opt-in)

We can still improve tag coverage and heuristics, but I agree this is a nice usability improvement for the typical use-case (I never really used it before).

Ref https://discourse.slicer.org/t/dwi-loading-from-dicom/1746/4
and 

cc @ljod @lassoan

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4bb1d7a644d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.