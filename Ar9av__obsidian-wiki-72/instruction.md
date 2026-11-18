# Issue

**Title:** Package as a pip-installable PyPI distribution

## Description

.

Publishes `obsidian-wiki` to PyPI so users can install without cloning the repo.

## What's in here
- **`pyproject.toml`** (hatchling, zero runtime deps). The Python package is the thin CLI; the markdown skills (`.skills/`) and bootstrap files are `force-include`d into the wheel under `obsidian_wiki/_data/` — repo root stays the single source of truth, no duplication.
- **`obsidian_wiki/` CLI** — a Python port of `setup.sh`:
  - `obsidian-wiki setup [--vault PATH]` writes `~/.obsidian-wiki/config` and **symlinks all skills** into every supported agent's skills dir (Claude, Codex, Gemini, Hermes + profiles, Pi, Copilot, Trae, Kiro, …). Symlinks point into the installed package, so `pip install -U obsidian-wiki` propagates updates everywhere.
  - `--copy` (instead of symlink), `--project [DIR]` (project-local skills + `AGENTS.md`/rule files), `--project-only`, plus `list` and `info`.
- **`.github/workflows/publish.yml`** — build + `twine check` + a guard asserting the wheel actually bundles the skills, then publish on `v*` tags via PyPI **Trusted Publishing** (OIDC, no token).
- **Docs** — pip install section added to `README.md` and `SETUP.md`; `.gitignore` covers build artifacts.

## Package name
`obsidian-wiki` — confirmed available on PyPI (matches the repo). `obsidian-llm-wiki` is already taken by an unrelated project.

## Design decisions (confirmed with maintainer)
- **Symlink** to the installed package by default (single source of truth; `--copy` available for symlink-hostile filesystems).
- **All** skills into the global `~/.claude/skills/` — pip users have no cloned repo to host project-scoped skills.

## Verified locally
- sdist + wheel both bundle all 37 skills (incl. nested `references/`, `scripts/`, `agents/` assets); `twine check` PASSED.
- Clean-venv install: CLI resolves data from `_data`, symlinks resolve to real `SKILL.md`s, `--version`/`info`/`list` work, and copy/project/project-only modes + idempotent re-runs all verified.

> Implementation note: the repo's committed agent symlink mirrors (`.claude/skills/<name>` → `.skills/<name>`) confuse hatchling's sdist VCS walker (it treats the symlink as canonical and drops the real `.skills` files), so `python -m build` initially shipped 1/37 skills. Fixed with an sdist `force-include` of `.skills`.

## Before first release (maintainer action)
1. On PyPI, register a Trusted Publisher for this repo: workflow `publish.yml`, environment `pypi`.
2. `git tag v0.1.0 && git push origin v0.1.0`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2176cb8ce801`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.