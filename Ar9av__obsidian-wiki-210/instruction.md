# Issue

**Title:** feat(server): read-only operations console at /ui

## Description

Addresses the Phase 1 scope of #208 — a browser view of vault operations.

## What's here

| Route | Returns |
|---|---|
| `GET /ui` | Static console shell — no build step, no dependencies, no vault data |
| `GET /v1/status` | Page/category counts, `_raw`/`_staging` depth, manifest source freshness, recent changes, git status |
| `GET /v1/health` | `run_doctor()` + `lint_vault()` |
| `GET /v1/staging` | Staged pages with a unified diff against the live page |

Everything is derived from the vault at request time — no database, no cached state. The health route calls the same Python the CLI calls rather than shelling out and parsing terminal output.

## Deliberately not here

**Staged promote/discard.** #208 asks to "reuse the existing staged-write semantics and `/wiki-stage-commit` behavior." That behavior lives in `.skills/wiki-stage-commit/SKILL.md` as agent instructions — `grep -rn "_staging" obsidian_wiki/` returns nothing. A promote button would mean writing a second promotion workflow, so this view links out to the skill instead. Porting that logic to Python is worth its own issue.

**Session cookies, CSRF, a login flow.** The shell is static and carries no vault data, and fetches with the same bearer key API clients already use, held in `sessionStorage`. No cookie means no CSRF surface.

**A sanitiser dependency.** `difflib` emits plain text; the client inserts it with `textContent`, which never invokes the HTML parser.

## Tests

Six new tests in `tests/test_server.py`: key enforcement on all three routes, counts derived from a fixture vault (including root-level `index.md` not being treated as a category), new-vs-update staging diffs, doctor+lint shape, and a shell that renders no vault content.

The XSS test stages a page containing `<script>` and an `onerror` handler and asserts no element is constructed from it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fcb97dc7e436`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.