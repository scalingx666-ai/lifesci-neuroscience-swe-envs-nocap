# Issue

**Title:** feat(cache): content-hash cache for reliable incremental ingestion

## Description

## Summary

- Replaces platform-specific `sha256sum` shell invocations in wiki-ingest with a dedicated Python module + 3 CLI commands
- `obsidian-wiki cache-check <vault> <sources...>` → JSON with `{new, modified, unchanged, missing}` — single call replaces the manual manifest-parse dance
- `obsidian-wiki cache-update <vault> <source> [--pages ...]` → records hash + pages_produced + timestamp after ingestion
- `obsidian-wiki cache-hash <path>` → just returns SHA-256 (file or directory tree)
- Directory hashing uses a stable sorted-walk so the same tree always produces the same hash regardless of filesystem order
- Pure stdlib — no new runtime dependencies
- wiki-ingest SKILL.md append-mode section updated to use the new commands

## Test plan

- [ ] `python3 -m pytest tests/ -q` — 53 tests pass
- [ ] `obsidian-wiki cache-check <vault> <file>` → `{"new": [...], ...}`
- [ ] Edit file, re-check → moves to `modified`
- [ ] `cache-update` → re-check → moves to `unchanged`
- [ ] Test on st3ve (Ubuntu): hash stability, manifest round-trips

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `caae3c2e0694`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.