# Issue

**Title:** [DOC] Add support page

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

.

Changes proposed in this pull request:

- Add page to docs for support and communication.
    - Points to GitHub for bug reports and feature requests, and NeuroStars for usage questions.
- Replace m2r with recommonmark for converting markdown to restructuredtext. This is related to a bug in `m2r` for Sphinx 3.0.0.
- Reorganize levels of headings in INSTALL.rst and README.rst, to clean up the RTD sidebar.
    - There are a number of cases of trailing whitespace that were automatically cleaned up by VSCode.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c28589449492`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.