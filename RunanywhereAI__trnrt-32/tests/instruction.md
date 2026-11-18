# Issue

**Title:** release: merging a promotion into main is the release, with no manual tag

## Description

## What and why

Merging a promotion into `main` is now the release: no manual tag, no label.

| Piece | Change |
|---|---|
| `tools/release_plan.py` (new) | On a push to `main`, reads `trnrt.__version__` and the existing tags and decides **release** (a final `X.Y.Z` with no tag, newer than every tag), **rerun** (the tag already points at this commit, so publishing runs again), or **skip** (the tag is elsewhere, or the version is a pre-release). A version that goes backwards is an error. So a merge into `main` that does not bump the version publishes nothing |
| `tests/test_release_plan.py` (new) | 12 cases on throwaway git repositories: new, newer-by-number (0.10.0 over 0.9.0), rerun, no bump, pre-release forms, backwards, non-release tags, the workflow output, and this repository's own version |
| `.github/workflows/release.yml` | Triggers on every push to `main` (and the existing dry runs). A `plan` job runs the tool. One job creates the tag **on the merge commit** and the GitHub release (the workflow's own token cannot start another workflow, so tagging and publishing share the run). PyPI follows, by trusted publishing from the `pypi` environment with `skip-existing`, and the image when `PUBLISH_IMAGE` is true. Each commit pushed to `main` gets its own concurrency group, so two promotions in quick succession both release (Codex review finding) |
| `docs/DEVELOPMENT.md`, `CHANGELOG.md` | The new flow, and the one-time PyPI setup |

**Applied in the repository settings (not in this diff):**

| Setting | Change |
|---|---|
| Environment `pypi` | created; deploys only from `main` |
| Ruleset "Release tags: admins create" | **deleted.** GitHub does not let its own Actions app be a bypass actor on a repository ruleset ("must be part of the ruleset source or owner organization"), so a rule restricting who creates tags would stop the release's token from creating one. "Release tags: immutable" stays: nobody can move or delete a `v*` tag. Only the three admins have write access |

## Not done yet, and why

- **PyPI:** there is no PyPI account on san@runanywhere.ai, and registration needs a human CAPTCHA and acceptance of PyPI's terms. The steps are in `docs/DEVELOPMENT.md` ("One-time setup for PyPI"). `PUBLISH_PYPI` is unset, so until it is set a release publishes the GitHub release only.
- **The first release:** `__version__` is 0.1.0 and no tag exists, so the first promotion into `main` after this merges releases v0.1.0. Nothing is promoted by this PR.

## Graphs

- [x] Host-side only: no change under `trnrt/kernels/` or `trnrt/models/`, and no graph shapes change

## Checklist

- [x] pre-commit passes (actionlint and zizmor included), mypy passes, `tests/test_release_plan.py`: 12 passed
- [x] Docs and `CHANGELOG.md` updated
- [x] This PR changes `release.yml`, so CI runs the release dry run, including the image build

<!-- This is an auto-generated description by cubic. -->
---
## Summary by cubic
Merging a promotion into `main` is now the release, with no manual tag: `tools/release_plan.py` runs on every push to `main` and decides, from `trnrt.__version__` and the existing tags, whether to release, rerun an earlier failed publish, or do nothing.

**Details**

- A release creates `vX.Y.Z` on the merge commit and the GitHub release in one job, since the workflow's token cannot trigger another workflow; PyPI and the image publish after, when enabled. A push that releases nothing builds nothing.
- Rebuilds of the same commit produce identical files, and a rerun uploads only the release files it lacks, never replacing one, so the checksums keep describing what PyPI received.
- A merge that does not bump the version publishes nothing, and a version older than the latest tag fails the run.
- Versions with leading zeros (`01.2.3`) are never released, since PyPI normalizes them and the resulting tag would not match what was published.
- Releases run one at a time, in order, so two promotions in quick succession both release; the run's summary names the action and the tag.
- PyPI uses trusted publishing from the `pypi` environment and runs only after the tag exists, since an upload cannot be taken back; `PUBLISH_PYPI` is unset until the one-time setup in `docs/DEVELOPMENT.md` is done.
- The ruleset restricting who creates tags was removed because GitHub cannot exempt its own Actions app; the immutable-tags rule stays, and only the three admins have write access.
- The planner is covered by 12 test cases on throwaway git repositories.

<sup>Written for commit 21dd23bb5a426c8abf50826911c533d3ec498aa1. Summary will update on new commits.</sup>

<a href="https://cubic.dev/pr/RunanywhereAI/trnrt/pull/32?utm_source=github" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/review-in-cubic-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/review-in-cubic-light.svg"><img alt="View guided diff" src="https://www.cubic.dev/buttons/review-in-cubic-light.svg"></picture></a> <a href="https://www.cubic.dev/action/auto-fix/pr/RunanywhereAI/trnrt/32?returnTo=https%3A%2F%2Fgithub.com%2FRunanywhereAI%2Ftrnrt%2Fpull%2F32&source=description" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/turn-on-auto-fix-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/turn-on-auto-fix-light.svg"><img alt="Turn on auto-fix" src="https://www.cubic.dev/buttons/turn-on-auto-fix-light.svg"></picture></a>

<!-- End of auto-generated description by cubic. -->

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->

<!-- coderabbit-ai-generated:v1 -->

## Summary by CodeRabbit

* **Release Updates**
  * Releases are now initiated when a version promotion is merged to the main branch. Eligible final versions are tagged and published with downloadable release artifacts; optional package and image publishing is also supported.
  * Existing releases can be rerun to retry publishing, while versions that do not qualify are skipped.
* **Documentation**
  * Updated release and development guidance to reflect the new release process and publishing setup.

<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04c37627f968`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.