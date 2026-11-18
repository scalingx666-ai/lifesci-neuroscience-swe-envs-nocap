# Issue

**Title:** IMPORTANT FIX PARCELLATION VOLUMES

## Description

there was a mistake for the normalisation of the cortical volumes when doing parcellation.
I also included some housekeeping for synthseg and friends

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd847012ae61`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.