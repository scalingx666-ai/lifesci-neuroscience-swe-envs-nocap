# Issue

**Title:** ENH: Add expected steps for FreeSurfer 7 recon-all

## Description

They hid their new recon-all table: https://surfer.nmr.mgh.harvard.edu/fswiki/ReconAllTableStableV6.0#ReconAllTableStable7.1.1

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e1080155e3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.