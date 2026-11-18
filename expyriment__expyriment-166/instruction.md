# Issue

**Title:** added method option to shuffle_blocks

## Description

This fixes two issues:
* arguments to `design.Experiment.shuffle_blocks` were not taken into account
* added parameter `method` to `design.Experiment.shuffle_blocks` (as in  `design.Block.shuffle_trials`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `559e702ece53`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.