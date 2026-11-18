# Issue

**Title:** [FIX] Fix usage and address requested changes to rapidtide parser

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

Closes None.

Changes proposed in this pull request:

- Remove the old CLI help from `usage.rst`, since it conflicted with the auto-generated one.
- Address @bbfrederick's review comments from #46:
    - Remove single-item mutually-exclusive parameter groups from rapidtide parser.
    - Remove incorrect information from "Analysis type" and "Macro" argument group descriptions.
    - Remove values set after parser that are duplicates of values from the parser.
- Remove usage simplifier for rapidtide argparser (this can be reverted if you'd prefer).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d8bc42efd6dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.