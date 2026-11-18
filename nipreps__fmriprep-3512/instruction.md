# Issue

**Title:** FIX: Write out Freesurfer-derived outputs

## Description

. I don't think I accounted for the versions of aseg and aparcaseg that get written out to the func directory, and I haven't thought about precomputed derivatives at all.

## Changes proposed in this pull request

- Add Freesurfer-related section from sMRIPrep's `init_anat_preproc_wf` to `init_single_subject_wf`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bef209a3bd1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.