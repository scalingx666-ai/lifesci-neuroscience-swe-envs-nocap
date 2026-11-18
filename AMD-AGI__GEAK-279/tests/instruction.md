# Issue

**Title:** fix(packaging): bundle reverse-knowledge entry_script inside the package

## Description

## Summary

Follow-up to the assets-packaging fix (#276 / #277) that bundled `subagents/` and `skills/`. This packages the remaining subprocess-subagent gap: the `reverse-knowledge` subagent's `entry_script` (`scripts/run-reverse_knowledge.sh`).

- **Root cause:** the script lived at repo-root `scripts/` (outside the importable package) and `entry_script` was resolved via `get_repo_root()`, so a plain `pip install` never shipped it and subprocess-mode `reverse-knowledge` could not start when GEAK was installed (only source/Docker worked).

## Changes

- Relocate the reverse-knowledge scripts (`run-reverse_knowledge.sh` + sibling `reverse_knowledge.py`) under `src/minisweagent/scripts/` and add the `scripts/**/*` `package-data` glob to `pyproject.toml`.
- Add `resolve_entry_script()` in `minisweagent/__init__.py`: resolves an entry_script **in-package first** (wheel/editable), keeping `GEAK_ROOT`, `/workspace`, and source-checkout roots as fallbacks. Route `subagent_cli._run_subprocess` through it.
- Make `run-reverse_knowledge.sh` location-independent: honor an inherited `GEAK_ROOT` (exported by the CLI) for the `mcp_tools/` knowledge workspace, and resolve the bundled agent config relative to the package dir.
- Set the executable bit on `run-reverse_knowledge.sh` (the CLI execs it directly) and update doc/path references.
- Add unit tests asserting the bundled entry_script resolves in-package, is executable, and that a missing script returns `None`.

## Test plan

- [x] `pytest tests/subagents` — green (10 passed).
- [x] Build wheel from this branch → confirm `minisweagent/scripts/run-reverse_knowledge.sh` (mode `0o755`) and `reverse_knowledge.py` are inside the wheel.
- [x] `pip install` the wheel into a fresh venv → from a CWD outside the source tree with no `GEAK_ROOT`, `resolve_entry_script("scripts/run-reverse_knowledge.sh")` resolves to `site-packages/minisweagent/scripts/run-reverse_knowledge.sh`, is a file, and is executable.
- [x] `bash -n` syntax check + `--help` smoke test of the installed script.

Scope: only the scripts/entry_script packaging; does not redo the #277 subagents/skills work.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `635a11e6e7df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.