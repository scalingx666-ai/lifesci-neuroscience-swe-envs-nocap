# Issue

**Title:** Fix check of dummy scans against external regressors

## Description

. The old behavior assumes that dummy scans have _not_ been removed from the fMRI data by the time the external regressors are validated, but that happens when the data are loaded.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Instead of checking that the number of rows in the external regressors is equal to (1) the number of volumes in the fMRI scan or (2) the number of volumes in the fMRI scan _minus_ the number of dummy scans, check (1) but change (2) to be the fMRI volume count _plus_ the dummy scan count.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `39cd09986c8b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.