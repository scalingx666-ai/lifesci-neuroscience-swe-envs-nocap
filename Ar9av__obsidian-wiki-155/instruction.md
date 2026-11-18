# Issue

**Title:** Bundle scripts/ into the published wheel

## Description

## Summary

 — same packaging-gap class as #143 (the Stop hook), which didn't cover `scripts/`. The `daily-update` skill's Setup Mode references `$OBSIDIAN_WIKI_REPO/scripts/daily-update.sh`, `.../scripts/com.obsidian-wiki.daily-update.plist`, and `.../scripts/wiki-notify.sh`, but `scripts/` was never force-included into the wheel, so pip/uv installs had no `_data/scripts/` and Setup Mode failed at its first existence check.

- `pyproject.toml`: added `"scripts" = "obsidian_wiki/_data/scripts"` to `[tool.hatch.build.targets.wheel.force-include]`, matching the existing `.skills` entry. `scripts/` isn't pruned from the sdist (unlike `/.claude`), so no sdist-side re-add was needed — the wheel just needed to know to pull it in.
- Also added a wheel-level `exclude = ["**/__pycache__", "**/*.py[co]"]`: while testing this fix I found force-include copies straight from the working tree rather than a VCS-filtered view, so my local `scripts/__pycache__` (from running `extract-jsonl.py`/`manifest.py`) leaked stray `.pyc` files into the built wheel. Confirmed clean after adding the exclude.

## Test plan
- [x] `uv run --with pytest pytest -q` — 279 passed (up from 274; 5 new), no regressions
- [x] New `tests/test_scripts_packaging.py` (same pattern as `test_stop_hook_packaging.py` from #143) pins the force-include config and that the daily-update skill's referenced script names actually exist in `scripts/`
- [x] Built the wheel for real (`python -m build --wheel`) and inspected it: `obsidian_wiki/_data/scripts/{daily-update.sh,com.obsidian-wiki.daily-update.plist,extract-jsonl.py,manifest.py,wiki-notify.sh}` all present, `daily-update.sh`'s executable bit preserved, no `__pycache__`/`.pyc` leakage
- [x] `pip install`ed the built wheel into a throwaway venv, ran `obsidian-wiki setup`, and confirmed `OBSIDIAN_WIKI_REPO` in the written config resolves to a real `_data` dir where `scripts/daily-update.sh` exists and is executable — i.e. the daily-update skill's Setup Mode Step 1 check now actually passes on a pip/uv install

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea4508114e33`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.