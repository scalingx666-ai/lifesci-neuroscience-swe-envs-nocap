# Issue

**Title:** chore: prepare repository for public access

## Description

## Summary
- add `.mailmap` aliases so contributor summaries use GitHub noreply identities without rewriting history
- give public pull-request CI explicit read-only permissions

## Scope
- no README or runtime changes
- no Git history rewrite

## Verification
- workflow YAML parses successfully
- `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8fd39864c2b6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.