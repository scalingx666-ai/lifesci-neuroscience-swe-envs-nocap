# Issue

**Title:** Add Obsidian layout adjustment skill

## Description

## Summary
- Add an Obsidian-specific layout adjustment skill for working with Dan on CSS styling changes
- Add the workflow reference for translating Dan's visual language into Obsidian layers/selectors
- Add eval prompts covering sidebar ownership, note lift diagnostics, tab/header mapping, and no-visual-change refactors
- Ignore generated skill benchmark/review workspaces and local packaged bundles

## Verification
- python3 -m json.tool .skills/obsidian-layout-adjustment/evals/evals.json >/tmp/obsidian-layout-evals-final.json
- git diff --check -- HEAD
- Packaged .skills/packages/obsidian-layout-adjustment.skill locally and verified it contains SKILL.md plus workflow-reference.md only

## Issue

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f290b05de13`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.