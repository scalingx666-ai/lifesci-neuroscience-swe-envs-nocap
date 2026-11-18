# Issue

**Title:** Exclude Liu2024 subjects 5, 15 and 49 by default

## Description

Their released files are derived from the recordings of subjects 4, 11 and 47: EDF sub-05 is bit-identical to sub-04 (15/49 reprocessed copies of 11/47), and in sourcedata.zip each equals its partner's raw recording minus i.i.d. uniform noise in [0, 1000) uV on every row. participants.tsv lists them as different patients, so keeping them puts one subject's EEG under two IDs and leaks it across cross-subject folds.

The dataset now exposes 47 subjects; include_derived_subjects=True restores the 50 released IDs with a UserWarning; asking for 5/15/49 without the flag raises a ValueError that names the flag. METADATA n_subjects and summary_imagery.csv follow (47, 1880 trials). Offline tests.

Evidence:  The NEMAR deposit nm000158 v1.0.4 carries the same notice; the dataset authors were contacted on 2026-10-14.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `91fb948777b4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.