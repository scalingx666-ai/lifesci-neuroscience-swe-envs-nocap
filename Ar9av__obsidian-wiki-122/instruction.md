# Issue

**Title:** feat(batch): parallel subagent batch planning for large-folder ingestion

## Description

## Summary

- `obsidian-wiki batch-plan <vault> <source-dir>` — discovers ingestible files, skips unchanged (via cache module), splits remainder into size+count-bounded batches, outputs a dispatch plan
- Supports `--max-mb`, `--max-files`, `--no-cache`, `--include-code`, `--pretty`
- `wiki-ingest` SKILL.md gets **Step 0**: for directories >20 files, call `batch-plan` first, then dispatch each batch as a parallel Claude subagent (multiple Agent tool calls in one message)
- Integrates with the cache module from PR #120: skips files whose hash matches the manifest before splitting
- Code files excluded by default (handled by `ast-extract` from PR #119)
- Pure stdlib — no new dependencies

## Test plan

- [ ] `python3 -m pytest tests/ -q` → 110 tests pass
- [ ] `obsidian-wiki batch-plan <vault> <dir-with-30-files> --max-files 10 --pretty` → 3 batches
- [ ] Mark one file as ingested via `cache-update`, re-run → `skipped_unchanged: 1`
- [ ] Test on st3ve

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d99df434802e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.