# Issue

**Title:** Add pheno004 example dataset

## Description

Meant for the resolution of bids-spec PR 2044. This is a dataset containing a mismatch of subjects with MRI data and tabular phenotypic data to be considered a whole dataset of participants for the sake of the participants.tsv file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e52f77fcd1ab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.