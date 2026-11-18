# Issue

**Title:** feat(wiki-ingest): optional PageIndex long-PDF preprocessing

## Description

Implements the proposal from issue #97 by @cnndabbler.

## What

Optional integration with [VectifyAI/PageIndex](https://github.com/VectifyAI/PageIndex) for long PDFs. When `PAGEINDEX_REPO` is set and a source PDF has ≥ `PAGEINDEX_MIN_PAGES` pages (default 30), `wiki-ingest` builds a structure-aware TOC tree first, then reads only the relevant page ranges — instead of dumping a 300-page book into context.

## Changes

- **`wiki-ingest/SKILL.md`** — gated step-1 branch (`### Long-PDF preprocessing`) inserted before `### Academic papers`. Fires only when `PAGEINDEX_REPO` is set + PDF is large enough; always falls back to direct page reads on error or when unset.
- **`wiki-ingest/references/pageindex.md`** — full recipe: run command, expected JSON shape (`doc_description` + `structure` tree with `start_index`/`end_index`), step-by-step reasoning approach, caching notes.
- **`.env.example`** — `PAGEINDEX_REPO`, `PAGEINDEX_MODEL`, `PAGEINDEX_MIN_PAGES`, `PAGEINDEX_WORKSPACE` keys with install instructions.

## Guardrails

- Fully optional and backward-compatible — with `PAGEINDEX_REPO` unset, behavior is completely unchanged.
- Never blocks an ingest: errors fall back to direct page reads.

---

@cnndabbler — does this match what you had in mind? Happy to adjust anything before merging.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `306c0c9a30fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.