# Issue

**Title:** Fixes bug in determining whether to unzip or untar ANTs download

## Description

After 2.4.1 ANTs switched to zipping its releases and so the template needs to check the versions. The newly added versions weren't included in this check

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf7da5fb8583`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.