# Issue

**Title:** Faster search on large encrypted vaults

## Description

Keyed vaults with 1000+ notes or files get sealed search pages (ranking data of 500 rows per page, built in the background while a member's key is held). Search scores rows from a fresh page and everything else row by row, with identical results; a missing, stale or damaged page only falls back. At most two encrypted search passes run at once server-wide.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a90bce52b49`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.