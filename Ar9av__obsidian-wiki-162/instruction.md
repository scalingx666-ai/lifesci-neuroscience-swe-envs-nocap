# Issue

**Title:** feat(trust): enforce owner authority and correction provenance

## Description

## Summary

- make vault-owner lifecycle/relationship/trust schema explicit and configurable
- preserve correction provenance and immutable conversation-source boundaries
- fail closed when configured schema sources or allowlists are blank/invalid
- expose exclusions and stale-ledger removals consistently in human and JSON output

## Verification

- targeted tests: 77 passed
- full current `origin/main` suite: 519 passed
- scoped Pyright delta: base 9, candidate 9, introduced 0
- scoped Ruff delta: base 11, candidate 9, introduced 0
- `git diff --check` and `compileall`: passed
- wheel and sdist build + Twine checks: passed

## Safety

- 11 exact reviewed files only
- no database, vault content, deletion, force-push, tag, or package-registry release
- branch is based on current upstream `main` (`3d39cb491a28cd11c96e13d31349a4a9367b865e`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d39cb491a28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.