# Issue

**Title:** fix: Improve retrieval of precomputed pepolar fieldmaps

## Description

Discovered while testing precomputed derivatives in aslprep, which imports `fmriprep.utils.bids.collect_fieldmaps`. See 

For PEPolar fieldmaps, the fieldmap reference is often `desc-epi_fieldmap.nii.gz`, as opposed to `desc-magnitude_fieldmap.nii.gz`. IMO, it would be good to change `desc-{epi,preproc}_fieldmap.nii.gz` to `desc-preproc_{magnitude,fieldmap}.nii.gz`, but this is what it is for now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0067e2d60d66`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.