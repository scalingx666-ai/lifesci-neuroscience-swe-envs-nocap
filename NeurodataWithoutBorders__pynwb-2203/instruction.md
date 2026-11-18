# Issue

**Title:** Address GitHub Actions deprecation warnings

## Description

## Motivation

.

The GitHub Actions workflows emit deprecation warnings (seen in [run 28013775824](https://github.com/NeurodataWithoutBorders/pynwb/actions/runs/28013775824)): Node.js 20 deprecation for several actions, the unmaintained `styfle/cancel-workflow-action`, and `setup-miniconda` warnings (`auto-activate-base` deprecated; implicit `defaults` channel).

## Changes

- **Bumped all actions to their latest versions** (aligning with the hdmf repo):
  `actions/checkout@v7`, `actions/setup-python@v6`, `conda-incubator/setup-miniconda@v4`,
  `codecov/codecov-action@v7`, `actions/upload-artifact@v7`, `actions/download-artifact@v8`,
  `actions/add-to-project@v2.0.0`, `actions/create-github-app-token@v3` (replacing `tibdex/github-app-token`),
  and `astral-sh/ruff-action@v3` (replacing the deprecated `chartboost/ruff-action`).
- **Removed `styfle/cancel-workflow-action`** from every workflow and replaced it with a native top-level
  `concurrency` group (`group: ${{ github.workflow }}-${{ github.ref }}`, `cancel-in-progress: true`),
  which reproduces the old `all_but_latest` behavior.
- **Fixed the `setup-miniconda` config**: `auto-activate-base: false` → `auto-activate: false`, and added
  `conda-remove-defaults: "true"` to silence the implicit `defaults` channel warning.

## Notes

- Used a **workflow-level** `concurrency` group (equivalent to the old workflow-wide `all_but_latest`) rather
  than hdmf's per-job/per-matrix groups. Happy to switch to per-job if preferred.
- All 11 workflow files validate as YAML. The action versions match those currently used in hdmf.

## Checklist

- [ ] Did you update CHANGELOG.md with your changes? <sub>CI-only maintenance; not user-facing, so no changelog entry. Let me know if you want one.</sub>
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style?
- [x] Have you checked to ensure that there aren't other open Pull Requests for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation?

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `483a4f16e8bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.