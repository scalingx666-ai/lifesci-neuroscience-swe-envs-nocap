# Issue

**Title:** ENH: fix multi gpu support + generalize utils

## Description

This PR 

- fixes multi-gpu support after adding periodic evaluation
- uses `tf.estimator.train_and_evaluate` to add periodic evaluation
- generalizes `nobrainer.preprocessing.from_blocks` to accept arbitrary shapes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `748c8804fab6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.