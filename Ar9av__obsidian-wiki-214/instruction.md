# Issue

**Title:** fix(deps): make uv lock/sync/run work, and declare pytest for tests

## Description

Every `uv lock`, `uv sync`, and `uv run` in this repo failed outright:

    No solution found when resolving dependencies for split
    (markers: python_full_version == '3.9.*')
    ... mcp>=2.0.0 depends on Python>=3.10 ...

uv resolves every Python version covered by `requires-python` (>=3.9), not just the active interpreter, and the `server` extra pulled in `mcp>=2.0`, which requires >=3.10. The 3.9 split therefore had no solution and the whole lock was unusable.

Two changes:

- Mark mcp as 3.10+ inside the `server` extra: `"mcp>=2.0; python_version >= '3.10'"`. This states what is already true rather than adding a new constraint: the memory server is a 3.10+ surface (server.py imports mcp at module scope, and the Dockerfile ships python:3.12-slim). The pure-stdlib CLI keeps its 3.9 support, so the CI matrix is unchanged.

- Declare pytest in a `[dependency-groups] dev` group so the suite runs through uv with no extra flags (`uv sync && uv run pytest tests/ -q`). CI previously pip-installed pytest ad hoc.

uv.lock is regenerated. It predated the `server` extra entirely — no fastapi/uvicorn/mcp entries — so uv re-resolved from scratch on every run.

Verified: `uv sync && uv run pytest tests/ -q` -> 701 passed, 5 skipped. `uv sync --extra server` pulls mcp 2.2.0 / fastapi 0.141.1 / uvicorn 0.52.4, and `import obsidian_wiki.server` yields `app = FastAPI`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e9e6abeaed4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.