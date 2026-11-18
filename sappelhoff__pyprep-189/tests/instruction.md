# Issue

**Title:** Vendor MATLAB PREP artifact generation; drop matprep submodule

## Description

Implements #160: bring the MATLAB PREP artifact-generation pipeline in-house and remove the `a-hurst/matprep_artifacts` git submodule.

## What changed

1. **Vendored the scripts** into `tools/matprep/` (`generate_artifacts.m`, `config/settings.m`, `config/pipeline_setup.py`, plus a pyprep-specific `README.md`). The `.m` files are copied verbatim from the submodule.
2. **New workflow** `.github/workflows/matprep_artifacts.yml` runs the pipeline on a MATLAB runner and publishes the artifacts to a rolling **`matprep-artifacts`** pre-release.
3. **Tests consume the new release** — `tests/test_matprep_compare.py` now downloads from `releases/download/matprep-artifacts/` instead of the upstream repo's `latest`.
4. **Submodule removed** — `.gitmodules`, the gitlink, and `.git/modules` entry are gone; `pyproject.toml`/`CLAUDE.md` updated accordingly.

## Decisions worth a look

- **Why a dedicated `matprep-artifacts` tag and not `latest`:** pyprep's `latest` release is its PyPI package release, so reusing the upstream `releases/latest` pattern would collide with it. The artifact release is marked `prerelease: true` + `make_latest: false` so it never hijacks the package release.
- **Pinning for reproducible ground truth:** EEGLAB stays pinned (2024.2) and **PREP is now pinned to commit `0914132` instead of `master`** (it was a moving target). The MATLAB *runtime* is left at `latest` — the numeric behaviour is governed by the pinned EEGLAB+PREP code, and pinning a runtime release that may not be provisioned on the runner adds fragility for little gain. Bumping any pin is meant to be a deliberate PR.
- **No cron:** with deps pinned, a monthly run would just reproduce identical artifacts. The workflow triggers on `workflow_dispatch` or pushes touching `tools/matprep/**`.

## Note for after merge

The `matprep-artifacts` release does not exist yet. The merge commit touches `tools/matprep/**`, so it will trigger the workflow on `main` and bootstrap the release; it can also be kicked off manually via **Run workflow**. Until that first successful run, `tests/test_matprep_compare.py` will 404 on download — expected.

.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a6b01c4237f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.