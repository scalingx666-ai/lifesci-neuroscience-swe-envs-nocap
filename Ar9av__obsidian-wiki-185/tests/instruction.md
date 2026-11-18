# Issue

**Title:** feat(server): run a vault as a Dockerized HTTP + MCP memory service

## Description

## Why

Everything else in this project is local: skills on your machine, a vault on your disk. There is no way for an agent somewhere else — another machine, CI, a hosted product — to use your wiki as memory.

This adds the smallest thing that fixes that: **one container, one vault on a mounted volume, one API key.**

The vault stays plain markdown, so Obsidian still opens it. The container does no LLM work — search and packing delegate to the existing `graphrag` / `context_pack` modules, and the caller's agent does the thinking.

## What's in it

- **`obsidian_wiki/server.py`** — one file. Four vault functions (`search`, `read_page`, `write_page`, `context_pack`); five REST routes and four MCP tools (`memory_search`, `memory_read`, `memory_write`, `memory_context_pack`) are transport over the same four.
- **`Dockerfile`**, **`docker-compose.yml`**, **`.dockerignore`**, and a **ghcr.io push** on `v*` tags.
- **`[server]` extra** — `fastapi`, `uvicorn`, `mcp>=2.0`. The core wheel stays `dependencies = []`; nothing imports `server.py` at module scope.
- **`docs/deployment.md`**, `WIKI_*` in `docs/configuration.md` and `.env.example`, one README bullet mirrored into `README_TW.md`.

## Security

- Refuses to start without `WIKI_API_KEY` unless `WIKI_ALLOW_ANONYMOUS=1`. No default key.
- Bearer compared with `hmac.compare_digest`. `/health` is the only exempt route.
- Every caller-supplied path resolves inside the vault or 400s; categories are slugified before becoming directories, so `..` never survives a write.
- Single-tenant by design, documented as such: no per-user isolation, quotas, or rate limiting, and TLS terminates at your proxy.

## Deliberately not included

Multi-tenancy, server-side distillation/dedup, an index cache, and S3/git sync code. Backup is a documented `aws s3 sync` one-liner against the volume — the vault is a directory, so it backs up like one.

## Verification

- `pytest tests/` — 656 passed, 1 skipped. The 9 new tests sit behind `importorskip("fastapi")`, so the dependency-free CI matrix is unaffected.
- Local server: write → search → read round-trips; correct frontmatter on disk; `log.md` appended.
- Real MCP SDK client over `/mcp`: lists 4 tools, two `call_tool` round-trips in one session.
- Container: built, wrote to a fresh volume, survived `docker restart`, healthcheck green, markdown on the volume verified.

## Note for reviewers

`mcp` 2.0 renamed `FastMCP` → `MCPServer`, and `session_manager` only exists once `streamable_http_app()` has been called. A mounted sub-app's own lifespan is ignored by Starlette, so it is wired into the FastAPI `lifespan` by hand — without that, `/mcp` accepts the first request and then hangs. Unit tests on the REST routes pass either way; only a live MCP client catches it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ae541c849cf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.