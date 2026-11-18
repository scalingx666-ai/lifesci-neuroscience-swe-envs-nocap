# Issue

**Title:** FIX: Review installation of Freesurfer matlab runtime

## Description

Solve #92 by installing `unzip` and use the new Freesurfer installation script `fs_install_mcr`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d335605d696`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.