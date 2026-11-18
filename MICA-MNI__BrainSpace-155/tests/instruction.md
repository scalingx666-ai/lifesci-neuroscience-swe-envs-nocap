# Issue

**Title:** Modernize CI workflows

## Description

.

## Summary

### `github_actions_ci.yml`
- `actions/checkout` v2 → v4, `actions/setup-python` v2 → v5 (drops the Node 16 deprecation warnings).
- **Drop `GabrielBB/xvfb-action@v1.5`** (unmaintained) → `pyvista/setup-headless-display-action@v3`, which is actively maintained and is the standard for VTK/PyVista CI.
- Matrix moved to Python `3.9, 3.10, 3.11, 3.12, 3.13` — drops EOL `3.7`/`3.8`, matches the metadata refresh in #144.
- Install via `pip install -e ".[test]"` so CI exercises the same `setup.py` metadata end users get from PyPI (instead of `requirements.txt` + ad-hoc `pip install pytest`).
- `matlab-actions/setup-matlab` and `run-tests` v0 → v2.
- Cache pip downloads via `setup-python`'s `cache: pip`.

### `python_coverage.yml`
- `actions/checkout@v1` → v4, `actions/setup-python@master` (unsafe floating tag) → v5, `codecov/codecov-action@v1` → v4.
- Run on `ubuntu-latest` with a headless display instead of `macos-latest` (faster runner, plotting tests now actually exercise the rendering path during coverage).
- Use `--cov=brainspace` instead of `--cov=./` to scope coverage to the package.

### `tagged_release.yml`
- `actions/checkout` v3 → v4, `actions/setup-python` v3 → v5; align Python pin.

## Test plan
- [ ] CI run on this PR is green across the full matrix.
- [ ] Codecov upload succeeds and reports coverage scoped to `brainspace/`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1c514a9a466`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.