# Issue

**Title:** Include the packaged agent skill

## Description

## Summary

- anchors the consuming-repository data ignore rule at the repository root
- adds the generic Encephalon skill that the broader ignore pattern had hidden from Git
- preserves the intended npm files whitelist and managed instruction target

## Root cause

The unanchored encephalon directory rule also matched skills/encephalon. Local tests saw the ignored working-tree file, while clean CI checkouts correctly did not.

## Verification

- Git index contains skills/encephalon/SKILL.md
- bun run typecheck
- bun run test: 30 Node tests and 3 Bun package tests
- bun run build
- bun run check:package

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `813e25cd814c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.