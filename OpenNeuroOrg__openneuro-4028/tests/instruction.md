# Issue

**Title:** chore: Update @bids/schema to 1.2.7-datacite

## Description

Approach: Rebased  onto `schema-1.2.7`, and reran `uv run bst export > schema-1.2.7-datacite.json`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1af6ee674b65`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.