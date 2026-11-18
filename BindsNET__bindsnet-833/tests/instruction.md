# Issue

**Title:** Release 0.3.5

## Description

## What this changes
- **Version 0.3.5** in `pyproject.toml`, `CITATION.cff` and `docs/source/models_spec.rst`. The `Unreleased` entries in `CHANGELOG.md` move under `[0.3.5] - 2026-10-29`, and a new empty `Unreleased` section is left on top.
- **Release rule changed** in `CONTRIBUTING.md`, the pull-request template and `test/regression/README.md`. Fixes that change results may now ship in any release, and are always listed first in the changelog under "Results changes", naming the affected classes or models. Before, they waited for 0.4.0. 0.3.5 itself ships such fixes from #831. Changes that break user code (a removed or renamed argument, a different return type, for example #801) still wait for 0.4.0. This change is also recorded under `### Changed` in the changelog.

## After merging
1. Publish a GitHub Release with tag `0.3.5` (the same style as `0.3.4`). `publish.yml` checks that the tag matches `pyproject.toml` and uploads to PyPI.
2. When Zenodo has archived the release, add its version DOI to `CITATION.cff` and `README.md` (both still name v0.3.4's DOI as the example).

## Checklist
- [x] `pytest -c pyproject.toml`: 641 passed locally. `python -m build` builds `bindsnet-0.3.5`.
- [x] Simulated results: not changed by this pull request (only the version, docs and changelog).
- [x] AI tool: Claude Code (Claude Opus 5.5).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9908bb487f3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.