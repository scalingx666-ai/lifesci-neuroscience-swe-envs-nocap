# Issue

**Title:** Advanced collection search.

## Description

- Adds filters for DOI, map type, modality, and task to collection table. 
- Adds new last modified column.
- Does not show empty collections in public view.
- Merges my collections and public collections templates.
- Removes "add new collection" button from bottom of page.
- Fixes delete Image 500 error from bad redirect.

We need look at the performance of the table JSON endpoint in production. This adds some potentially costly database operations.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `711fb08c54c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.