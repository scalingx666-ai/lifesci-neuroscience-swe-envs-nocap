# Issue

**Title:** [REF] Reformat rapidtide parser and usage documentation

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

Closes None. I should have opened an issue about this before opening this PR, but I wanted exhibit some changes I was hoping to make to the package with a test case (the rapidtide parser).

Changes proposed in this pull request:

- Run `black` on `workflows/rapidtide_parser.py` and `workflows/parser_funcs.py`. This standardizes the style a bit and should help with PEP8-related issues. Plus, it has the added benefit of minimizing future diffs, which will make it easier to review changes.
- Switch from printing messages to logging them in `workflows/rapidtide_parser.py` (related to #41).
- Add some argument group-level descriptions (in addition to the titles) in `workflows/rapidtide_parser.py`.
- Adopt UpperCamelCase for a class in `workflows/parser_funcs.py`, to match PEP8 convention.
- Adopt CAPITALCASE for constants in `workflows/parser_funcs.py`, to match PEP8 convention.
- Clean up a few heading levels in `docs/usage.rst`, and add a comment that documents the levels for easy reference (I kept confusing myself).
- Use code formatting in a couple of places in `docs/usage.rst`, which might make referencing arguments a little easier.
- Hide debugging-related arguments in the argparse-generated documentation in `docs/usage.rst`. I didn't actually know about this feature before now, and it's pretty cool!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e613032495e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.