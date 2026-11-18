# Issue

**Title:** BUG: Miscellaneous cleanup for compliance PyPI

## Description

- BUG: Use a single author-email in `setup.py`
- BUG: Set the long description content type to Markdown
- BUG: Remove non-existing pattern under `doc` in `MANIFEST.in`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f9d47dac4d36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.