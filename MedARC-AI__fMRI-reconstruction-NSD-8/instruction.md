# Issue

**Title:** Fix text voxel2clip and the eval notebook

## Description

The Evaluation.ipynb notebook had its content duplicated in my last PR by mistake, so I removed the extra copy at the end and also added an outdir parameter to save the reconstructions into (useful for tracking multiple versions of CLIP image, text, image+text, etc).

For the train_voxel2clip.py script, I updated it to work with text CLIP by bringing in the change made to the e2e script. In the validation loop, I think the mixco parameters were mistakenly being passed in to the utils.mixco_nce loss, so I took those out since it was throwing exceptions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `047950e6e2dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.