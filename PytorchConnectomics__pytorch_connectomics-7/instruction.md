# Issue

**Title:** refactor train/test scripts

## Description

- create a separate folder "run/" for train/test function

- simply "get_input()": given a tensor in memory, we can create a "test_data_loader"

- add unet_2d model for mito prediction

- modify "setup.py" for "find_packages()"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6bc6b5f4b06a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.