# Issue

**Title:** fix: resolve import error when importing _fetch_files from nilearn

## Description

Hi there,

It seems like netneurotools is importing some private utilities from nilearn like `_fetch_files`.
Recently, nilearn made some changes to its structure and moved this utility function from `nilearn.datasets.utils` into a private `nilearn.datasets._utils` module (the function was also renamed `fetch_files` since it is now within a private module). There was no deprecation warnings as this is not part of the nilearn public API.

This is impacting the Clinica project on which I am working (because it depends on Brainstats which depends on netneurotools).

This PR proposes to fix the broken import in a backward compatible way using a simple try/except.

If this solution is acceptable, could you make a patch release soonish such that we can fix this dependency issue on our side.

Many thanks !

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4fc46fa5ab37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.