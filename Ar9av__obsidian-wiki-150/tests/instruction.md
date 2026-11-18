# Issue

**Title:** Make source discovery git-aware for repo ingestion

## Description

## Summary
-  — clarifies and improves the workflow for ingesting local git repo clones (public or private, any host).
- `obsidian_wiki/batch.py`: `discover_sources`/`batch-plan` now detect a `.git` folder in the source directory and enumerate files via `git ls-files --cached --others --exclude-standard` instead of a raw `os.walk`. This means a repo's own `.gitignore` decides what gets skipped (custom-named build/vendor dirs, `.env` files, generated artifacts, etc.) rather than relying on the hardcoded `SKIP_DIRS` list, which only covers common conventional names. Non-repo folders fall back to the previous walk behavior unchanged.
- Docs: `.env.example`, `wiki-ingest/SKILL.md` (new "Ingesting Git Repositories" section), and `wiki-setup/SKILL.md` now spell out the answer to the issue directly — clone the repo locally first (this project never clones/authenticates against remotes itself), point `OBSIDIAN_SOURCES_DIR` at the clone path (comma-separated, multiple repos supported), and re-running ingest after a `git pull` only reprocesses changed files via the existing hash-based cache.

## Test plan
- [x] `uv run --with pytest pytest -q` — 249 passed (existing suite, no regressions)
- [x] Added `TestDiscoverSourcesGitAware` in `tests/test_batch.py` covering: respecting a repo's `.gitignore` for non-hardcoded dir names, including untracked-but-not-ignored files, still skipping `.git/` itself, and falling back to the plain walk for non-repo directories
- [x] Manually exercised `obsidian_wiki.cli batch-plan` against a throwaway git repo with a custom-named `.gitignore`'d directory (`node_modules_custom_ignored/`, not in the hardcoded skip-list) — confirmed it was correctly excluded while `README.md` and `src/main.py` were included

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2363445eac5a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.