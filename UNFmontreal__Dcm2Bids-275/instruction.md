# Issue

**Title:** [BF] Auto extractors and merge regex expressions

## Description

Before this fix, auto_extract_entities was trying to feed all entities found with auto_extractors even if auto_entities was more strict.

Also when providing custom extractors it was overwrote by auto_extractors.

Need some testing, @SamGuay  I will send you some data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42cd77b823ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.