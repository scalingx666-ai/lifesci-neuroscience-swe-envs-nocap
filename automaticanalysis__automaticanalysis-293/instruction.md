# Issue

**Title:** Smallfixes

## Description

This small PR contains some small clean-ups and fixes:
- aamod_CONN: typo
- aa_delete_deststage: relocation and documentation
- aamod_firstlevel_threshold and aamod_secondlevel_threshold: fix probability-based extent threshold
- aamod_meeg_preparesourcemodel: spatial alignment between the atlas and sourcemodel (cortical sheet from FreeSurfer)
- aaq: aaq initialSubmitArguments for SLURM/Torque
- aaq_batch: fixes task duration
(N.B.:  changes to .github/workflows/aa_test.yml and aa_tools/provenance/aa_provenance.m can be ignored because the contents have not changed)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01bde66a06e7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.