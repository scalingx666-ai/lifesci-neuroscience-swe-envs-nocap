# Issue

**Title:** ci: area labels on every PR from the paths it changes, forks included

## Description

## What and why

Area labels on every pull request from the paths it changes, the way SGLang labels its PRs, forks included.

| File | Change |
|---|---|
| `.github/labeler.yml` (new) | paths → `router`, `serve`, `engine`, `kernels`, `models`, `docs`, `ci`, `graphs-changed` |
| `.github/workflows/pr-labels.yml` (new) | applies them with `actions/labeler` after "PR checks" completes |
| `.github/workflows/pr-checks.yml` | a `PR number` job hands the PR number over as an artifact |
| `.coderabbit.yaml` | CodeRabbit only suggests labels now; the rules file is the one source |
| `tests/test_labeler.py` (new) | `graphs-changed` equals the traced paths (`pyproject.toml`) plus `trnrt/__main__.py`; every rule names files that exist |
| `docs/DEVELOPMENT.md`, `CONTRIBUTING.md`, `CHANGELOG.md` | the new workflow |

**Why `workflow_run` rather than `pull_request_target`:** a fork's `pull_request` run has a read-only token, and GitHub blocks `pull_request_target` by default in public repositories from 2 December 2026. The labelling job runs in this repository's context from the default branch's workflow and rules. It never checks out or runs PR code, and takes only the PR number from the PR's run, after checking it's a number. zizmor's `dangerous-triggers` audit is acknowledged inline for that reason.

## Graphs

- [x] Host-side only: no change under `trnrt/kernels/` or `trnrt/models/`, and no graph shapes change

## Checklist

- [x] `pre-commit run --all-files` passes (actionlint and zizmor included); `tests/test_labeler.py` passes
- [x] Docs updated (`docs/DEVELOPMENT.md`, `CONTRIBUTING.md`, `CHANGELOG.md`)

`workflow_run` only fires for workflows on the default branch, so the labels start after this merges; the first PR after it is the end-to-end check.

<!-- This is an auto-generated description by cubic. -->
---
## Summary by cubic
Adds area labels to every PR from the paths it changes, forks included.

- The labelling workflow runs after "PR checks" completes, in the repository's context and from the default branch's label rules, so it never runs PR code. PR checks hands it the PR number as an artifact, which it only accepts when it names the PR whose head commit triggered the run; a cancelled or superseded run is skipped, not failed.
- Labels sync with the diff: one comes off when a later push no longer touches its paths.
- CodeRabbit now only suggests labels; `.github/labeler.yml` is the single source for them.
- A new test keeps `graphs-changed` equal to the traced paths plus `trnrt/__main__.py`, every rule pointing at files that exist, and the label vocabulary equal to CodeRabbit's.
- Docs updated (`docs/DEVELOPMENT.md`, `CONTRIBUTING.md`, `CHANGELOG.md`).

<sup>Written for commit 0b82bcaf0943e340699949a128ac4fc5117e175e. Summary will update on new commits.</sup>

<a href="https://cubic.dev/pr/RunanywhereAI/trnrt/pull/26?utm_source=github" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/review-in-cubic-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/review-in-cubic-light.svg"><img alt="View guided diff" src="https://www.cubic.dev/buttons/review-in-cubic-light.svg"></picture></a> <a href="https://www.cubic.dev/action/auto-fix/pr/RunanywhereAI/trnrt/26?returnTo=https%3A%2F%2Fgithub.com%2FRunanywhereAI%2Ftrnrt%2Fpull%2F26&source=description" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/turn-on-auto-fix-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/turn-on-auto-fix-light.svg"><img alt="Turn on auto-fix" src="https://www.cubic.dev/buttons/turn-on-auto-fix-light.svg"></picture></a>

<!-- End of auto-generated description by cubic. -->

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->

<!-- coderabbit-ai-generated:v1 -->

## Summary by CodeRabbit

* **New Features**
  * Pull requests now receive area labels based on the files they change, including pull requests from forks. Labeling runs after the standard checks and does not block merges.
* **Documentation**
  * Updated contribution and development guides to explain area labeling and when it runs.

<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce99615e5b2a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.