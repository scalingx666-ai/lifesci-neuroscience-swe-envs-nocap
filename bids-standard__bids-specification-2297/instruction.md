# Issue

**Title:** [FIX] Update navigation with respect to the `bids-starter-kit`

## Description

- [x] Remove link to `bids-starter-kit` GitHub repo since those files are now hosted in the `bids-website` repo
- [x] Change navigation accordingly: `The BIDS Starter Kit` -> `The BIDS Website`

cc @satra @ayendiki

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `074ae6ffcdcf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.