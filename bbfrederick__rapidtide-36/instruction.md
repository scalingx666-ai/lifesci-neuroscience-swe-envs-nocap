# Issue

**Title:** [TST, DOC] Switch CI to CircleCI

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

 and #35.

Changes proposed in this pull request:

- Add CircleCI config files. This includes the following workflows:
    - Python 2.7 tests
    - Python 3.6 tests
    - Python 3.7 environment build
    - Python 3.7 tests + coverage
    - Linting
    - Build docs and store artifacts
    - Deploy to PyPi (only on tags matching `/[0-9]+(\.[0-9]+)*/`)
- Remove Travis config file.
- Turn RTD config file back on. I'm happy to debug if the RTD build fails.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `45fcf6d83904`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.