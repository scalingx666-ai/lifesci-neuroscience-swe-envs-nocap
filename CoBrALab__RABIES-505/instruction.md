# Issue

**Title:** Ignore __pycache__, .venv, docs/_build and .DS_Store

## Description

Four untracked paths that show up in `git status` during normal local work:

- `__pycache__/` — from `pip install -e .`
- `.venv/` — uv/venv default location
- `docs/_build/` — sphinx output directory set in `docs/Makefile`
- `.DS_Store` — macOS Finder

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01Kdq57U3c4xpcRTXWhtpWrt

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `13d32fe2c61d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.