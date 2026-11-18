# Issue

**Title:** Erc fireants

## Description

Added in the atlas files and script dependencies to use fireANTs registration package for mri_histo_atlas_segment_fireants
Updated the requirements.txt file to install the fireANTs package
- Currently this points to my fork of their repo, as the version of their pyproject.toml breaks fspython

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ac61a2e630b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.