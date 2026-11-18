# Issue

**Title:** FIX: Remove empty/`n/a` entries from dataset_description.json

## Description

I believe this the reason that  is failing. In any case, there's no advantage to having optional keys with empty or invalid contents.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f935685e8fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.