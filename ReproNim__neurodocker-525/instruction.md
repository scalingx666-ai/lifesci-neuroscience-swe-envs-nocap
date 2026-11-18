# Issue

**Title:** Enable build of docs with Sphinx 6

## Description

`pydata-sphinx-theme` is now compatible with Sphinx 6 since .

Changes in this commit:

- Add upper bound on Sphinx as recommended by `pydra-sphinx-theme`
- Add lower bound on `pydra-sphinx-theme` to force cache updates if necessary
- Drop lower bound on Sphinx, let `pydata-sphinx-theme` handle it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ce946105544`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.