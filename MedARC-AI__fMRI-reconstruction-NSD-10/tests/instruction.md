# Issue

**Title:** Update voxel2clip training for text and resnet

## Description

- Add argparse instead of the old brittle configurator, all defaults are the same as before
- Support resnet RN50 as the clip variant for testing the MindReader f_mr version
- Flip the forward and backward top 1 retrieval scores so that they match Evaluation.ipynb 
- Cast trial to numpy before using it to get the annotations
- Update remote_data=True for average splits so I can run on my own machine
- Make it save the best checkpoint 
- Remove unused imports, splitter methods, and other junk things

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c966f94abd3e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.