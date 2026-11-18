# Issue

**Title:** fix(datasets): activate inner dataset NEMAR store in CompoundDataset

## Description

Fixes `CompoundDataset._get_single_subject_data` and `CompoundDataset.data_path` bypassing the inner dataset's NEMAR `sourcedata/` store (which caused `tutorial_5_combining_datasets.py` in the `Docs` build to hit Zenodo 500 instead of reading `nm000236` from NEMAR).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a4742907f1c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.