# Issue

**Title:** Added option to evaluate all snapshots, fixed bug when prediction_dec…

## Description

I added a use_snapshots boolean parameter to vame.evaluate_model, when set to True it will evaluate all snapshots (similar to DeepLabCut) which allows the user to get a better look at how training went. It would benefit from more documentation that if they want to use a snapshot rather than what is considered "best model" you would just move that .pkl file into the 'best_model' folder.

I also fixed a typo at the end that still directs users to next use vame.behavior_quantification, which is from the old version, I believe now the next step is to use vame.pose_segmentation.

Lastly, there was a bug in running evaluate_model when prediction_decoder was off (it would return a blank reconstruction image). I fixed that bug.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `974f72579fca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.