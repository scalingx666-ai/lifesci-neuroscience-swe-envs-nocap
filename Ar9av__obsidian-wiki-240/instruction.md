# Issue

**Title:** docs: _raw/ promotion archives originals, not deletes them

## Description

docs/configuration.md said wiki-ingest removes promoted _raw/ files; the
skill moves them to _raw/_archived/. Align the docs and pin the contract.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33ce8ce444b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.