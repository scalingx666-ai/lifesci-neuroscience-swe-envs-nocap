# Issue

**Title:** Add Selenium tests

## Description

To make sure some typical workflows work with development and release versions, it seems useful to have a small set of Selenium GUI tests. This branch adds the required infrastructure and integrates it into our Travis CI tests. Selenium tests are defined as Django unit tests and live under ``django/applications/catmaid/tests/gui/``. There is currently only a single small test implemented: load the index page, check for syntax errors, login and logout. A typical output (including screenshots) can be found [here](https://saucelabs.com/jobs/abe748ab718d42d9a93c9dd223c6196d) and there is a new badge in our readme file.

 To run such tests locally the ``GUI_TESTS_ENABLED`` setting has to be set to True or otherwise all GUI tests are ignored. The CI test setup activates GUI tests automatically and also sets ``GUI_TESTS_REMOTE`` to ``True``, which allows it to automatically run Selenium tests on the virtual machines of saucelabs.com.

This PR is more or meant as documentation, but of course I appreciate any concerns or comments. I don't think we need to write a lot of these tests, but a handful of simple tests could already provide some extra robustness: login/logout, open all registered widgets, create a few nodes, etc.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c6ad5367408`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.