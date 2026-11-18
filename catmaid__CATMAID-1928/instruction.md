# Issue

**Title:** List connectors typo

## Description

Additionally, I'm pretty sure the `params['relation_id'] = relation_id` line is unnecessary, because the case is already covered in line 288.

Thanks to @schlegelp for the bug report.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd3c413d8ed0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.