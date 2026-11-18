# Issue

**Title:** refactor(skills): fold 3 redundant skills into survivors (38→35)

## Description

## Why

Continues the skill-surface consolidation from #84. Three skills fully overlapped a survivor, forcing users and the router to disambiguate near-duplicates. Folded in — **no functionality lost** (verified on st3ve, see below).

## What changed

**`obsidian-wiki-ingest` → deleted.** A self-described *"wrapper for wiki-ingest"* that did nothing wiki-ingest doesn't.

**`wiki-quick-chat-capture` → `wiki-capture --quick`.** Quick mode folded into `wiki-capture` as a documented fast path (KEEP/SKIP gate, `_raw/` staging, <60 s, no manifest/index/log/QMD writes). `RAW-FORMAT.md` moved to `wiki-capture/references/`. The session-end **Stop hook** (`.claude/hooks/wiki-stop-capture.sh`) now asks for `/wiki-capture --quick` — auto-capture preserved.

**`ingest-url` → `wiki-ingest`.** URL ingestion folded in. The full mechanics (project detection, defuddle preflight, dedup, slug, project/misc frontmatter, affinity scoring, stub handling, `INGEST_URL` log) moved verbatim to `wiki-ingest/references/url-sources.md`, pointed to from a new *Web URL sources* section.

Every reference repointed: `AGENTS.md` (+`CLAUDE.md` symlink), `README`, `wiki-setup`, `wiki-query`, `llm-wiki`, `RAW-FORMAT.md`, mirror rule files.

## Verification (headless agents on st3ve, scratch vault)

- **Quick capture:** followed `wiki-capture --quick` on a Next.js finding → wrote `_raw/2026-06-11-nextjs-cookies-forces-dynamic-rendering.md` (`capture_source`, `base_confidence: 0.85`); confirmed `index.md`/`log.md`/`.manifest.json` **untouched**. ✅
- **URL ingest:** followed `wiki-ingest` URL handling on `https://example.com` from a non-repo cwd → misc mode, slug `web-example-com`, `source_type: url`, `base_confidence: 0.37` (unknown-host formula), `affinity: {}`, `INGEST_URL` log line. ✅
- Deleted skills absent; `grep` for `obsidian-wiki-ingest`/`wiki-quick-chat-capture` → zero.

Skill surface: **38 → 35**.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b1cd29dc8cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.