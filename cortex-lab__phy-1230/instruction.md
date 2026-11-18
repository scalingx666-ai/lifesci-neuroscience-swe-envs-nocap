# Issue

**Title:** Update requirements.txt

## Description

Some people are following the developer instructions on the readme, which were missing a few packages in the requirements.txt, I've added the missing packages into the requirements, based on the conda environment.

I've also deleted the old install file inside of the `installer` folder, because some issues are coming up with people using the wrong `environment.yml` to install phy.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8bf8cf751fcb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.