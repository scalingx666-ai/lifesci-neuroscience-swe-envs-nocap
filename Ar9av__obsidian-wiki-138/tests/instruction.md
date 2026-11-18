# Issue

**Title:** feat(skills): snapshot vault before destructive writes

## Description

## Summary

- snapshot Git-backed vaults before `cross-linker`, `wiki-dedup`, and `wiki-lint --consolidate` perform destructive writes
- require the vault itself to be the repository root so `git add -A` cannot capture unrelated parent-repository changes
- distinguish a clean repository from a failed snapshot and abort before vault writes when staging or committing fails
- record an actionable snapshot SHA and document complete rollback commands
- add contract tests covering all three skills

## Why

These skills can rewrite many vault pages in one run. A pre-write commit provides a cheap rollback point, but the initial implementation treated any directory inside a Git worktree as a standalone vault repository. From a nested vault, `git add -A` can stage sibling files outside the vault. It also treated an empty commit's non-zero exit ambiguously and did not provide a complete rollback command.

This version scopes the snapshot to standalone vault repositories and fails closed when the promised snapshot cannot be created.

## Validation

- `216 passed, 11 subtests passed`
- shell syntax checked for all three embedded snapshot blocks
- exercised clean, dirty, nested, non-Git, commit-failure, and rollback scenarios for every affected skill

Tracks the fork issue:

Closes mike840609/obsidian-wiki#4

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `50a8edfb60fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.