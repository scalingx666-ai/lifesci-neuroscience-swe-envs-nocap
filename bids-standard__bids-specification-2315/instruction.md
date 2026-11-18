# Issue

**Title:** [FIX] Update and render schema definition of dataset_description.json

## Description

The metadata table displayed in https://bids-specification.readthedocs.io/en/stable/modality-agnostic-files/dataset-description.html and the one in the schema that is validated got out of sync.

This updates the schema table to match the one on the spec, and renders the table from the schema.

* [Updated table](https://bids-specification--2315.org.readthedocs.build/en/2315/modality-agnostic-files/dataset-description.html#dataset_descriptionjson)
* [Original](https://bids-specification.readthedocs.io/en/latest/modality-agnostic-files/dataset-description.html#dataset_descriptionjson)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1cc32de26378`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.