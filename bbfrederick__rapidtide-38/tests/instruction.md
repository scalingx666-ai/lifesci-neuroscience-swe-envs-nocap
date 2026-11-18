# Issue

**Title:** [FIX] Fix CI and some tests

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

- Fix link I added to badge in #37.
- Ignore subfolder of tests.
- Drop caching of py27 and py36 environments. There's almost definitely a way to cache all of them, but after some testing in NiMARE I kept having one environment's step overwriting the others.
- Pin statsmodels version by Python version.
- Fix a couple of tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4fed653d92e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.