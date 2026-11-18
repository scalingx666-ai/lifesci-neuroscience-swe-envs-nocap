# Issue

**Title:** DOC: Update documentation URLs in XML files

## Description

Slicer module documentation is being moved from Slicer wiki to slicer.readthedocs.io. CLI module descriptor files are updated accordingly (along with some typo fixes).

@hjmjohnson

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9637a823726a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.