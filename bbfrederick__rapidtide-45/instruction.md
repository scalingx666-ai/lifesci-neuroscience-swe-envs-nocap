# Issue

**Title:** [DOC] Fix ReadTheDocs build

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

- Delete candidate_usage.md
- Use cv-table for BIDS outputs table
- Fix header issues in RST files
- Reorganize conf.py
     - Better sections
     - Remove conflicting numpydoc extension. Just use Napoleon.
- Don't run an outdated `showxcorrx` example

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec80ffcb6e51`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.