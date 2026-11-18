# Issue

**Title:** Solves #555, NIDM Results download feature. Added tests

## Description

Solves #555, it was complaining because nidm is not an statistical map set and could not access to the files. As it is now, when downloading, it takes just the nidm_result.zip (which includes the statistical map and the ttl). Also I added a test for this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `442c3acb9c98`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.