# Issue

**Title:** DOC: Document `freesurfer` parameter in BOLD confound workflow init

## Description

## Changes proposed in this pull request

Document `freesurfer` parameter in BOLD confound workflow initialization function.

Take advantage of the commit to move the `name` parameter docstring after `freesurfer` to match the function signature.

## Documentation that should be reviewed

`init_bold_confs_wf` function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03e209f659ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.