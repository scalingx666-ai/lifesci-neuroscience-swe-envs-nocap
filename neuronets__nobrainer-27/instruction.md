# Issue

**Title:** ENH: Allow features to be dict + add export outputs in predict

## Description

Proposes allowing features to be a dictionary in MeshNet and adding `export_outputs` when predicting for SavedModels.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `289bc6a84d48`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.