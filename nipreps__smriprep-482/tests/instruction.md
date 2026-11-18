# Issue

**Title:** ENH: Generate cortex mask in anat_fit_wf

## Description

Based on @effigies' idea in  This new output should make it possible to project data to the surface just using computed derivatives.

Changes proposed:

- Move roi output out of `init_hcp_morphometrics_wf`.
- Calculate that output in a new workflow, `init_cortex_mask_wf`.
- Add step to `init_anat_fit_wf` that calls `init_cortex_mask_wf`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7679ad3d0173`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.