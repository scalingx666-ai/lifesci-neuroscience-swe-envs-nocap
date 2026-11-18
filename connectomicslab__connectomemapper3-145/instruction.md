# Issue

**Title:** FIX: List of outputs are empty in inspector window of the parcellation and fmri_connectome stages [skip ci]

## Description

This corrects the name and path of the data sinker nodes of the anatomical and functional pipeline that is used to extract the outputs to be displayed in the inpector window of cmpbidsappmanager.

As this impacts only the GUI and has been fully tested locally, I will skip the CI.

Fix #144

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `adbeb3ad3b87`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.