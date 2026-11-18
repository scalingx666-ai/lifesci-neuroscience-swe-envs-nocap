# Issue

**Title:** refactor(skills): merge data-ingest into wiki-ingest

## Description

## Why

`data-ingest` was effectively `wiki-ingest` plus a format-detection preamble — its own process step literally said *"Follow the wiki-ingest skill's process for creating/updating pages."* Having two overlapping ingest skills forced both users and the skill router to disambiguate (a `.md` ChatGPT export fit either one). Fewer skills = simpler UX.

## What changed

- **`wiki-ingest` now handles everything** — structured documents *and* raw/unstructured text (chat exports, Slack/Discord JSON, CSV/JSON, transcripts, logs, bookmarks).
- Added an **"Unstructured & conversational sources"** section to Step 1: format-detection table, chat-export shapes (ChatGPT/Slack/generic log), and "distill substance, not dialogue" + topic-clustering guidance carried over verbatim from data-ingest.
- Expanded the `wiki-ingest` description to absorb data-ingest's triggers (`ingest this data`, `process this export`, `process these logs`, `import my chat history from X`).
- Manifest `source_type` note now includes `"data"` for chat/log/CSV/JSON sources.
- **Deleted** `.skills/data-ingest/` and repointed every reference: `AGENTS.md` (+ `CLAUDE.md` symlink), `README.md`, `SETUP.md`, `llm-wiki`, `wiki-status`, `wiki-rebuild`, `wiki-quick-chat-capture` (+ RAW-FORMAT), and the mirror rule files for cursor/windsurf/agent/kiro/copilot.

## Verification

- `grep -rn "data-ingest"` (excluding `vault/`) → **zero** matches.
- `wiki-ingest` retains its rows in the llm-wiki confidence table; capability wording preserved everywhere a reference was repointed.
- Tested on st3ve (see comment / below).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de3a090b8f4b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.