# Issue

**Title:** Spatialtolerance

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
- Allow slight differences in spatial dimensions between NIFTI files to account for rounding errors in creating some masks.
- Fixes a critical bug that makes multiprocessor runs fail for Python 3.10 and higher.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `478ee2fd5974`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.