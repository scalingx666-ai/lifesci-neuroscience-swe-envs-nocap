# Issue

**Title:** numpy.float deprecated, this is now changed in io.py

## Description

When running rapidtide -CVR io.py was called and there was a line there that called np.float() which is deprecated in the latest numpy package (1.24.4). This was causing an error. Now fixed.

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->
[fix][ref]

Changes proposed in this pull request:

- np.float() changed to float in io.py in order to make it compatible with the latest numpy package

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `13c19a08109c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.