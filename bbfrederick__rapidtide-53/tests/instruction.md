# Issue

**Title:** [FIX, TST] Drop caching from 3.6 and 3.8 tests in CI

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

Closes None. It looks like CI has been failing because caches were stepping on top of one another.

Changes proposed in this pull request:

- Drop `build_py38` job and replace with `test_py38` one.
- Remove caching from `test_py36` and `test_py38` jobs.
    - I'm sure there's a way to cache all three environments, but I don't know how to do it. In the meantime, only the most important one, 3.7, will be cached, and all of the others will need to be reconstructed each time CI is run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `023cf250162d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.