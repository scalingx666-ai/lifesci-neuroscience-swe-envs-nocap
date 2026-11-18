# Issue

**Title:** Mindgrab: powerful omnimodal skull stripping model

## Description

Adding a skull stripping model that can work on (practically) any modality: mindgrab https://arxiv.org/abs/2506.11860

# visible changes
- two ways to run the model: memory efficient slow and about 2x faster but memory intense model

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `536cc24f931e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.