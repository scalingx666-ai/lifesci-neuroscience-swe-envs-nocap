# Issue

**Title:** Read Graphify graphs in code-understand, lint uncovered sources, test on Windows/macOS

## Description

## Summary

**Graphify backend for `code-understand`.** If a project already has `graphify-out/graph.json`, `wiki-update` reads it instead of re-parsing the code.
- Read only: obsidian-wiki never runs Graphify, so it spends no tokens.
- `auto` order: CodeGraph, then Graphify, then builtin.
- Graphify's edge confidence becomes the item's `evidence` (`graphify-extracted` / `-inferred` / `-ambiguous`), and extracted edges rank first.
- The wiki-update skill treats inferred edges as leads to verify before citing.
- Warns when `graph.json` is older than the newest committed file.

**`uncovered_sources` lint finding.** Flags manifest entries whose `pages_produced` / `pages_created` / `pages_updated` list is empty, or names only pages that no longer exist. That is a source the vault says it ingested but no page carries any more.
- Count-only entries are skipped.
- A warning; `--strict` fails on it like the other structural warnings.
- 0 findings on a real 170-source vault.

**CI on Windows and macOS.** The test workflow adds `windows-latest` and `macos-latest` on Python 3.12. This is the first Windows run, so failures there may be pre-existing and are worth looking at separately.

Per-prompt recall was also on the list, but it already exists as the opt-in `wiki-prompt-recall.sh` hook, so this PR leaves it alone.

## Test plan
- [x] `pytest tests/`: 1245 passed locally on macOS
- [x] New `tests/test_code_understanding_graphify.py` uses the node-link shape from Graphify's own `worked/httpx/graph.json`
- [x] New coverage case in `tests/test_lint.py`
- [ ] Windows and macOS jobs green in CI

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3190dae1795c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.