# Issue

**Title:** MRG: move doc building to use gh-pages

## Description

Machinery to upload docs to gh-pages.

Deprecate old sourceforge stuff.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6b2e862c655`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.