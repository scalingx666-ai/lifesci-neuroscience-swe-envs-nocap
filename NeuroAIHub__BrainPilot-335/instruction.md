# Issue

**Title:** fix(web): separate KB data consistency from query readiness

## Description

## Summary

- : empty Knowledge Base no longer shows a green “all in sync / healthy” state that users read as ready-to-use.
- Introduces `deriveKbReadiness` to separate **data consistency** (four-stage ledgers) from **query readiness** (PDFs + vectors + Python env).
- Adds an overall readiness banner with explicit next steps (add PDFs / setup env / rebuild).
- Inventory card uses neutral styling for empty corpora; green “ready to query” only when fully usable.

## Test plan

- [x] `packages/web` unit tests: `kbReadiness.test.ts` (empty, env-missing, stale, need-build, fully-ready)
- [x] `tsc -b` for web package
- [ ] Manual: open Settings → Knowledge Base with 0 PDFs and missing venv — overall banner is not green; next step points to add PDFs; inventory headline is empty/neutral
- [ ] Manual: with PDFs + vectors but env not ready — data consistent, overall “need env”
- [ ] Manual: fully ready stack shows green “ready to query”

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `44561ee3fc5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.