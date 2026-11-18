# Issue

**Title:** Fix export connectors bug

## Description

Previously, the "intra_and_original_placeholders" option was not
picked up, likely due to a typo.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2dd0356c1598`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.