# Issue

**Title:** Model_based_curation + unitrefine prediction: add `unit_ids` input

## Description

The current implementation of `unitrefine` takes a `SortingAnalzyer` as input, runs the noise/neural classifier, creates a new `SortingAnalyzer` with neural units (with `remove_units`) and then runs the SUA/MUA classification.
This PR allows to run the function (and the model based classificaiton), direclty from computed metrics, preventing the memory copy of the `remove_units`.

It also simplifies the implementation of some helper function and phy exporter in the `model_based_curation`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f03253e9c7ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.