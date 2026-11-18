# Issue

**Title:** feat(ast-extractor): local code structure extraction with no LLM calls

## Description

## Summary

- Adds `obsidian-wiki ast-extract <path>` CLI command — free local extraction of classes, functions, imports, and inheritance edges from code files using deterministic regex patterns (no API calls, no tokens)
- 12 languages supported: Python, JS, TS, Go, Rust, Java, Kotlin, Ruby, C, C++, Swift, Shell
- Outputs god nodes (top hubs by degree), node-link JSON compatible with any graph tool
- `wiki-ingest` SKILL.md updated with Step 1c: run AST extraction first on code sources, seed entity pages from class nodes, skip sending raw code to the LLM
- Optional `obsidian-wiki[ast]` extra for future tree-sitter upgrade path
- 19 new tests

## Motivation

Copies graphify's core insight: code structure is deterministic — parse it locally for free, only send docs/comments to the LLM. Dramatically reduces token cost when ingesting a codebase.

## Test plan

- [ ] `python3 -m pytest tests/ -q` — all 28 tests pass
- [ ] `obsidian-wiki ast-extract <code-dir> --pretty` outputs valid JSON with nodes, edges, god_nodes, stats
- [ ] Test on st3ve (Ubuntu Lightsail): install package, run ast-extract on a Python repo

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6dee95edeb0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.