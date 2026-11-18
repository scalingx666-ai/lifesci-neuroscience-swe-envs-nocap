# Issue

**Title:** Adds modified getStateCorrs sub-function to icatb_postprocess_dfc_roi.m

## Description

Adds modified getStateCorrs sub-function (originally found in icatb_post_process_dfnc.m) to roi-based dFC post-processing. Adds call to getStateCorrs after kmeans clustering is run on the full input dataset (all subjects and windows). This provides users with two additional fields (corrs_state and states) in clusterInfo which are needed for group or individual subject analyses.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3a836e12f6c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.