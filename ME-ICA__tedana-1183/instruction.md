# Issue

**Title:** Support Python 3.13

## Description

Python 3.13 has been out long enough that I decided to see if tedana runs on it & it ran fine & all tests passed. 

Changes proposed in this pull request:

- Adds python 3.13 to pyproject.toml as a version that can be used with tedana.
- Add python 3.13 to the circleci unit tests (if I correctly made those edits)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `894eb7719c04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.