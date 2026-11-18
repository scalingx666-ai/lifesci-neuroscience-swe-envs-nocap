# Issue

**Title:** fix: Use buffer node to hold fsnative2anat transform

## Description

When a precomputed fsnative2anat transform was found, we were not recomputing it, but it was not injected into the workflow. The bug could be considered to be part of failing to set the `outputnode` of the `surface_recon_wf`, but it feels easier to me to keep track of in the top-level fit workflow.

@tsalo Can you patch this into your container?

May fix #496.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5fa7032a252b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.