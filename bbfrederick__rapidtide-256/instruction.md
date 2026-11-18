# Issue

**Title:** Robustdelayfit

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

Closes # .

Changes proposed in this pull request:

- Add a new region growing procedure after initial despeckling to intelligenly merge patches of displaced delays while still allowing for discontinuities due to vascular territory boundaries and pathology.
-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `faba918a4223`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.