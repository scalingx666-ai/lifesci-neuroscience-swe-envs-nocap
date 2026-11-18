# Issue

**Title:** [fix] Add batch size for ACE.

## Description

ACE wasn't using any batch size for MC versions of the model. Update so that it takes the SW batch size as the regular batch size as well.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2a16eb389aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.