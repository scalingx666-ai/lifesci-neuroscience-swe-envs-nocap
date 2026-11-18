# Issue

**Title:** Use continuous TPM-based procedure to calculate aCompCor masks

## Description

Cloes #3587.

## Changes proposed in this pull request

- Assume that anatomical TPMs come from FAST and not Freesurfer's aseg output, since sMRIPrep always uses FAST. This means setting `freesurfer` to False in `init_bold_confs_wf`.
- Update boilerplate in `init_bold_confs_wf` to reflect changes and what is actually happening.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf7d4c42fc04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.