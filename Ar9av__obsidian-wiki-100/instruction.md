# Issue

**Title:** feat(ingest): add extract-jsonl.py pre-processor for 50-200x JSONL compression

## Description

## Problem

Raw Claude Code JSONL files are **80-90% noise** by byte count — `tool_use` blocks, `thinking` blocks, `progress` events, and `file-history-snapshot` entries dominate. The ingest skill had to read all of it, which meant:

- Only 5-10 conversations could be processed per run (context budget exhausted on noise)
- A 12 MB JSONL session used as much context as ~180 actual conversation turns
- 80%+ of sessions were never ingested because each raw file was too expensive to read

## Solution

**`scripts/extract-jsonl.py`** — a stdlib pre-processor that strips noise before the LLM ever sees the data.

### Measured compression on real sessions

| Raw JSONL | Extracted JSON | Ratio |
|---|---|---|
| 559 KB | 8.6 KB | **65×** |
| 12 MB | 64 KB | **188×** |

Typical session: `tool_use` + `thinking` + snapshots account for 80-90% of bytes; only user messages and assistant `text` blocks are kept.

### New workflow

```bash
# Run once (or daily via cron) to pre-extract everything
python3 scripts/extract-jsonl.py --skip tsg,autom8

# Incremental — only new/modified sessions
python3 scripts/extract-jsonl.py --since 2026-06-01 --skip tsg,autom8

# Then run the ingest skill as usual — it will find the extracted files automatically
/claude-history-ingest
```

Extracted files live at `~/.claude/extracted/<project>/<session-id>.json`.

### Skill changes (`claude-history-ingest/SKILL.md`)

1. **New "Pre-extraction" section** — documents the script, usage examples, output format
2. **Step 3 updated** — check `~/.claude/extracted/` first, fall back to raw JSONL
3. **Sampling heuristic fixed** — projects with memory files previously had all conversations silently skipped. Now: ingest memory files first, then also process conversations not yet in the manifest

## Files changed

- `scripts/extract-jsonl.py` — new stdlib script (pure Python, no deps)
- `.skills/claude-history-ingest/SKILL.md` — pre-extraction docs + Step 3 + heuristic fix

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `306c0c9a30fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.