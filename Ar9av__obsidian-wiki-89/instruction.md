# Issue

**Title:** Canonical manifest paths + project skip scoping + manifest helper

## Description

.

## Problem

Three frictions surfaced during a real history-ingest run:

1. **Mixed path forms (#86).** Source keys were stored as both `~/.claude/...` and `/Users/me/.claude/...` — the schema example in `wiki-status/SKILL.md` literally documented both. The manifest is keyed by the raw string, so the *same file* got tracked twice and re-ingested in append mode. **5 such collisions were found in a real 137-source vault.**
2. **No project scoping (#87).** History-ingest skills scan all projects; excluding private/scratch/noisy dirs meant hand-writing `grep -v` into every ad-hoc command, drifting between the scan and manifest steps.
3. **Ad-hoc manifest writes (#88).** The skills say 'update `.manifest.json`' with no helper, so the agent writes raw inline Python each run — easy to get quoting wrong, and it didn't normalize or honor skips.

## Changes

- **`scripts/manifest.py`** — pure-stdlib helper (matches existing `scripts/` convention):
  - `normalize <vault> [--dry-run]` — rewrite source keys to canonical absolute paths, merge collisions (keep newest `ingested_at`, union `pages_created`/`pages_updated`).
  - `delta <vault> --scan '<glob>' [--skip a,b]` — list new/modified sources vs the manifest, honoring `WIKI_SKIP_PROJECTS` + `--skip`, with paths already canonical.
- **`llm-wiki/SKILL.md`** — canonical-source-key rule + provenance recording note; `WIKI_SKIP_PROJECTS` in the env table.
- **`wiki-status/SKILL.md`** — schema example now uses absolute paths consistently; canonical-key callout.
- **`claude-history-ingest/SKILL.md`** — Project Scoping step, canonical-path compare note (with helper usage), conversation sampling heuristic (memory files → skip raw convos; else read 3 most recent), desktop-session pre-check, hot.md frontmatter-timestamp reminder.
- **`.env.example`** — `WIKI_SKIP_PROJECTS`.

The instructions still work without the helper — it's an optional accelerator that makes the manifest steps deterministic and testable.

## Testing

- **Local:** `normalize --dry-run` caught all 5 real collisions (137 → 132); `delta` with `WIKI_SKIP_PROJECTS` dropped new count 14 → 13 (8 files skipped).
- **Remote (st3ve, Ubuntu 24 / Python 3.12.3):** scp'd over; syntax + help OK; synthetic collision test confirmed merge keeps newest `ingested_at` and unions pages lists, and `--skip` excludes the right project. Live data untouched.
- **Real repair:** normalized a live vault manifest (removed 5 dup entries; verified 0 collisions remain, all keys absolute).
- Idempotent on already-canonical manifests; graceful on missing/empty manifests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f057168ea813`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.