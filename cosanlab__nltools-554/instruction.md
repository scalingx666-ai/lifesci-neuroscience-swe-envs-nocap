# Issue

**Title:** Release-verification cleanups: fold dev tags in the changelog, lint scripts/, refresh the contributing page

## Description

Release-verification cleanups from #507, none of which change the package.

- **Changelog**: git-cliff now ignores `v*.devN` tags, so the 0.6.0 section will hold the whole milestone instead of only the commits after `v0.6.0.dev3`. Verified by rendering: one Unreleased section, 1186 lines, versus four dev sections before.
- **Gate**: `ruff check` and `ruff format --check` cover `scripts/` as well as `nltools/` in `poe ok` and `poe lint`. `scripts/marimo_to_zensical.py` is formatted; every other script already passed.
- **Docs**: the contributing page describes the site as it is built now, and the parked `docs-staging/tutorials/index.md` (the old ten-notebook plan) is removed. The nav is flat with no index page.

Verification at master 1da9b27f before these commits: full slow-inclusive suite 1290 passed, 1 skipped (the CPU-only bootstrap test, skipped because this machine has MPS); `poe ok` 1218 passed; cold strict `docs-build` 36 s, no issues; the migration guide's network fence fetched 84 pain images and the 84 files of NeuroVault collection 504.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1da9b27f2320`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.