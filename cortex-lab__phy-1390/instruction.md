# Issue

**Title:** Automate dependency maintenance

## Description

## Summary

- run the main CI workflow automatically for pull requests and pushes to `master`
- grant the workflow read-only repository contents access
- group future uv minor and patch updates into a weekly Dependabot pull request while leaving major updates separate
- update idna to 3.15, urllib3 to 2.7.0, pip to 26.1.2, tornado to 6.5.7, and Pillow to 12.2.0

The idna and urllib3 updates include security fixes. The five dependency updates arrived as separate lockfile-only Dependabot pull requests with no checks because CI was manual-only.

## Impact

Dependency maintenance will produce fewer pull requests and each pull request will receive the complete Linux, macOS, and Windows test matrix automatically. The package metadata remains at `2.1.1.dev0`.

## Validation

- `uv lock --check`
- `uv run ruff check phy`
- `uv run ruff format --check phy`
- `uv run pytest --cov=phy --cov-report=xml phy` (440 passed, 1 skipped)
- `uv build`
- `uv run phy template-gui ../phy-data/template/params.py` (sustained-startup smoke test)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a63597725c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.