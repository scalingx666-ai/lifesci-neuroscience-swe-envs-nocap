# Issue

**Title:** Update ISC test documentation with caveat about FPRs

## Description

I added caveats about the nonparametric ISC tests "not strictly controlling false positive rates" in consideration of #466. @cbaldassano—let me know if you any think this is sufficient, or if you having any suggestions about wording.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `776b7b844851`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.