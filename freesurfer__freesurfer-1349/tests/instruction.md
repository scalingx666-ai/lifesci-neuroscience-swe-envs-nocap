# Issue

**Title:** recon-all-clinical script error

## Description

recon-all-clinical.sh was not working properly and I was getting this error:

`then: then/endif not found.`

This quick fix seems to work

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `57c574450f2f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.