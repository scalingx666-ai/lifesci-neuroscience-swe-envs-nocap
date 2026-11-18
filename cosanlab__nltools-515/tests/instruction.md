# Issue

**Title:** build: remove the MyST toolchain and run the strict docs build in CI

## Description

.

## What this does

Removes the MyST toolchain the zensical migration left behind: the `jupyter-book`/`mystmd` dependencies (lock refreshed), `docs/myst.yml`, `docs/plugins/unlinkify.mjs`, `scripts/myst_to_zensical.py`, the MyST/Node/npm steps in `ci.yml` and `weekly.yml`, and the MyST prose in `CLAUDE.md` and `docs/contributing.md`. The CI docs legs now run the same strict `docs-build` the deploy runs, so a broken link or a bad mkdocstrings directive fails CI rather than only the deploy. `docs-deploy.yml` was already on zensical and is unchanged.

`rg -i 'myst|jupyter-book|mystmd'` outside the changelog and the lock returns nothing.

## Verification

- `uv run poe ok`: 989 passed, 1 skipped
- cold `rm -rf site && uv run poe docs-build --strict`: no issues, 8.4 s
- the three workflow files parse as YAML

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1abb85067a27`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.