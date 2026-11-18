# Issue

**Title:** Bidsonly

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

Changes proposed in this pull request:

This pull request removes several legacy features:
1) All outputs from rapidtide and happy are in BIDS derivative format.
2) The ability to select legacy outputs has been removed.
3) The legacy versions of rapidtide and happy (rapidtide2x_legacy and happy_legacy) have been removed.
-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4d55537f5b0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.