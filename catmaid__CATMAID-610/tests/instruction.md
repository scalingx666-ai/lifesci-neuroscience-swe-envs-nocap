# Issue

**Title:** Highlighting: small performance fix

## Description

Sorry, had to add a small fix to #608 I forgot about:

should test if highlight_tags is being used at all before calling the filter.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `909b0e2a26d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.