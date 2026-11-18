# Issue

**Title:** Hotfix: faster encrypted search under load

## Description

Search score data on encrypted vaults is compressed before sealing (existing rows are re-sealed in place by the background job), and scoring yields to other requests so one heavy search no longer slows the whole server.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4415d17ef3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.