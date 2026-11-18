# Issue

**Title:** [INFRA] Add GitHub Action for deployment to PyPi

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

References #35. This should be the last step before making releases, but I'd rather close that issue _after_ testing the Action.

Changes proposed in this pull request:

- Remove deployment step from the CI.
- Remove the filter from the CI that would make the CI run on releases.
- Add a GitHub Action for deploying/publishing to PyPi.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `26954ebfee32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.