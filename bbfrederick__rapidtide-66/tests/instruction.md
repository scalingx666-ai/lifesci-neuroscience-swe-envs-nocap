# Issue

**Title:** [REF] Fix logger call and reformat general logger

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

Addresses bug from #65.

Changes proposed in this pull request:

- Fix mistake in logger call.
- Change general logger format to more free-form text.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `31ab0bfd31e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.