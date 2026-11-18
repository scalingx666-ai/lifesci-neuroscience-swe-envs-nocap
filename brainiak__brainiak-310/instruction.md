# Issue

**Title:** Adding statistical tests to ISC and ISFC

## Description

Adding statistical testing through phase randomization, as requested by https://groups.google.com/forum/#!topic/brainiak/vZnOgGoV7q4 and as described in Simony et al. (2015, DOI: 10.1038/ncomms12141)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f708dfbd6cea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.