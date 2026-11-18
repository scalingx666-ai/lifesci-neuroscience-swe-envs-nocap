# Issue

**Title:** Update deprecated pandas function

## Description

Hi,
thanks for maintaining this repository. It seems the latest version is not compatible with pandas versions > 2.0 since pandas decided to fully remove the function df.append(). See below for small fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f49dbc160653`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.