# Issue

**Title:** chore: add secret detection pre-commit hooks

## Description

## Summary
- Add `detect-private-key` hook (catches PGP, RSA, SSH, EC private keys)
- Add `detect-secrets` (Yelp) hook (catches API keys, tokens, passwords, high-entropy strings)

## Test plan
- [x] Both hooks pass on existing codebase (verified during commit)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd9ca16e27e7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.