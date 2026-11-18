# Issue

**Title:** Hoops resolution fix

## Description

as hoops previously had 50um resolution added incorrectly. as part of this fix i have left the 50um in the AWS bucket but added a 20um. the 20um has a version increment to 3.2 (however 3.1 and 3.0 are 50um).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be1b541a7568`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.