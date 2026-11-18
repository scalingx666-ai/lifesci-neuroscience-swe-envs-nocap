# Issue

**Title:** [genomic_browser] PSCID links contain 4 leading zeros (using CandID padding instead of DCCID standard length)  #11054  -fix

## Description

[genomic_browser] PSCID links contain 4 leading zeros (using CandID padding instead of DCCID standard length)
 #11054
fix links from  "https://test-dev-270.loris.ca/0000300007/" to "https://test-dev-270.loris.ca/300007/"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `900c33e82f16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.