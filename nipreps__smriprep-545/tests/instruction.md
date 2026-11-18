# Issue

**Title:** FIX: Address brittleness of packaging test

## Description

## Summary
The `Build & verify package` job in `build_test_deploy.yml` was failing at `hynek/build-and-inspect-python-package` for two independent reasons:

1. Repeated action invocation in the same job reused `/tmp/baipp`, causing:
   - `A virtual environment already exists at /tmp/baipp`
2. Pinning to `v2.9` exposed a tooling incompatibility on runner Python 3.14:
   - the action's internal tool lockfile used `pydantic-core==2.20.1`
   - that version failed to build via PyO3 under Python 3.14

## Root Cause
- The action is called twice in one job and uses a fixed venv path (`/tmp/baipp`).
- `@v2.9`'s toolchain is not compatible with Python 3.14 in this flow.
- A workflow-level `setup-python: 3.13` step did not control this, because the action sets up its own Python internally (`python-version: 3.x`).

## Solution Implemented
- Added explicit cleanup before each action invocation:
  - `rm -rf /tmp/baipp`
- Replaced `@v2.9` with a deterministic pin to the current `v2` commit:
  - `hynek/build-and-inspect-python-package@c8508a8c721100cf0319cd57d297a5fcacc7cc40`
- Removed the ineffective external `setup-python` workaround from the `build` job.

## Validation
- Reproduced the `v2.9` failure locally in a similar environment using micromamba:
  - Python 3.14 venv at `/tmp/baipp`
  - `uv pip sync` against `v2.9` tools lockfile
  - observed the same `pydantic-core` / PyO3 failure
- Re-ran the same reproduction against the current `v2` tools lockfile:
  - sync succeeded (includes newer `pydantic-core`)
- CI on this branch now passes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `603dd2e82282`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.