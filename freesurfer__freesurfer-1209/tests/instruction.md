# Issue

**Title:** nnUNet_v1.7 conda env build scripts/docs

## Description

Scripts, docs, and updated cmake file for building the environment needed to run Jiaming's segmentation tool.

create_nnUNet_v1.7_env.sh gets installed into FS_HOME/bin
install_nnUNet_v1.7_instructions.md is installed into FS_HOME/docs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71d13f8aad8a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.