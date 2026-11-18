# Issue

**Title:** feat: doctor checks latest framework version

## Description

## What

- Drop the `versions.latest` network check: `doctor` stays fully offline — no `--check-updates`, no `version-check.json` cache, no `meta.latest_*`.
- `docs/cli.md` gains a short `Upgrading the framework` section (pip / `uv tool` / `pipx` upgrade, then re-run `setup`).
- `doctor --json` keeps a minimal `meta` block (`package_version`, `setup_version`).

## Verification

- `tests/test_doctor.py` 16/16 pass; full suite 843 passed, 4 skipped (pre-existing skips)
- No live network anywhere; `doctor --check-updates` is now correctly rejected as unrecognized

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1bd4aae6ac64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.