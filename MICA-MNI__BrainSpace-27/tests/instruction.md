# Issue

**Title:** [GIT] Changed Travis CI for GitHub actions

## Description

List of changes:
- Removed Travis CI
- Implemented Github actions to run:
  - pytest on all tests using windows-latest, macos-latest, and ubuntu-latest on Python 3.6, 3.7, and 3.8. 
  - pytest with code coverage on macos-latest. Code coverage runs only on this branch and the master branch.
 - Added code coverage and github actions badges to README.rst and ReadTheDocs main page.
 
 To do:
 - Fix (out of memory?) errors in ubuntu and windows.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1a2ded0b1f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.