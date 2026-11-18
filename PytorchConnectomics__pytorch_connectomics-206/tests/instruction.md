# Issue

**Title:** ci: add working PyPI publish workflow + fix empty-wheel packaging

## Description

.

## What this does
Adds a working CI workflow that publishes to PyPI when a GitHub Release is published, and fixes a packaging bug that would otherwise have shipped an empty distribution.

## Why the existing setup didn't work
There was already a `build-wheels.yml` intended to publish on tag push, but it could not run:
- `actions/upload-artifact@v3` / `download-artifact@v3` were **shut down by GitHub in 2025** (v4 required; v4 also rejects the duplicate artifact name the old matrix used).
- Runner images `ubuntu-20.04`, `macos-11`, `windows-2019` are **retired**.
- It built a 15-way OS × Python **wheel matrix**, but the package is **pure Python** (no `ext_modules`, no `.pyx`), so that was wasted work — a single universal `py3-none-any` wheel + sdist is correct.

## Packaging bug found & fixed (blocker)
`pyproject.toml` had:
```toml
[tool.setuptools]
packages = ["connectomics"]
```
That ships only the top-level `connectomics/__init__.py` (a 0-byte file) and **none of the subpackages** — `models`, `data`, `training`, `decoding`, etc. A built wheel contained exactly **1 code file**. Publishing that to PyPI would push a broken, empty package under the project's name (and PyPI versions can't be re-uploaded).

Fix — switch to a `find` directive:
```toml
[tool.setuptools.packages.find]
include = ["connectomics*"]
namespaces = false
```
Verified locally: the wheel now contains **169 files across all 11 subpackages**, only `connectomics/` ships (no tests/scripts/tutorials leak), and `twine check` passes on both wheel and sdist.

## New workflow (`.github/workflows/publish-pypi.yml`)
- **Build job**: builds sdist + universal wheel, runs `twine check`, uploads as an artifact.
- **Publish job**: uses **PyPI Trusted Publishing (OIDC, `id-token: write`)** — no API token stored as a secret.
- Triggers on **GitHub Release publish**; `workflow_dispatch` is a build-only dry run (publish gated by `if: github.event_name == 'release'`).

## ⚠️ One-time maintainer setup required before the first release
Trusted Publishing needs a publisher configured on PyPI (this cannot be done from the repo):
1. On https://pypi.org, add a **pending publisher** (Account → Publishing) for:
   - **PyPI project name:** `pytorch-connectomics`
   - **Owner:** `PytorchConnectomics`  · **Repo:** `pytorch_connectomics`
   - **Workflow:** `publish-pypi.yml`  · **Environment:** `pypi`
2. (Optional but recommended) create a GitHub Environment named `pypi`.

Then publishing a GitHub Release runs the workflow and uploads to PyPI.

> **Name note:** the distribution publishes as **`pytorch-connectomics`** (from the `[project]` table, which takes precedence over `setup.py`'s stale `name="connectomics"`). The bare `connectomics` name on PyPI is owned by google-research, so it isn't available. The redundant/misleading `setup.py` metadata is pre-existing and left untouched here — worth a separate cleanup.

## Testing
- Built sdist + wheel in an isolated venv before/after the fix (1 file → 169 files).
- `twine check dist/*` → PASSED.
- Editable install + `import connectomics.{models,data,training,decoding}` → OK.
- `scripts/validate_tutorial_configs.py` → clean.
- Workflow YAML parses; triggers/permissions/environment verified.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a68b05ad62a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.