# Issue

**Title:** Use windeployqt to generate install targets

## Description

Remove the comment "`TODO: add the executable name to a list we feed to *deployqt later on?`" and change some minor things.

Tested:
- build, install and run on OS X
- build and debug from install folder in VS2017
- build the super repo with this PR, `cpack` correctly generates one archive per module (including Qt dependencies) and one installer with options for each app and liblsl

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f74014f47fe0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.