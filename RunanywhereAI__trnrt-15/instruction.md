# Issue

**Title:** ci: run on pushes to development and main

## Description

## What and why

CI runs on every pull request, but on push only for `main`. Pull requests now merge into `dev`, so a merge into `dev` got no CI run of its own. This adds `dev` to `ci.yml`'s push trigger, and updates the CI table in `docs/DEVELOPMENT.md` to match.

## Graphs

- [x] Host-side only: no change under `trnrt/kernels/` or `trnrt/models/`, and no graph shape changes
- [ ] Changes compiled graphs: which ones, and the `tools/graph_equiv.py` or device evidence

## Accuracy

Not applicable: no code changes.

## Performance

Not applicable.

## Checklist

- [ ] `make check` passes (lint, type-check and the CPU suite): not run locally; this pull request's CI runs it. Pre-commit on the two changed files passes, as do `tests/test_no_trace.py`, `test_third_party_notices.py`, `test_no_abbrev.py` and `test_check_docs.py`.
- [ ] Tests cover the change: not applicable to a workflow trigger.
- [x] Docs updated (`docs/DEVELOPMENT.md`). `CHANGELOG.md` is unchanged: its CI entry names no branches.

<!-- This is an auto-generated description by cubic. -->
---
## Summary by cubic
Runs CI on pushes to `development` as well as `main`, since PRs now merge into `development` and previously got no post-merge CI run.

- Updates the `ci.yml` push trigger to include `development`.
- Updates the CI workflow table in `docs/DEVELOPMENT.md` to match.

<sup>Written for commit b596365a923b48a2a27ab2c20f41c6b9635b7cf8. Summary will update on new commits.</sup>

<a href="https://cubic.dev/pr/RunanywhereAI/trnrt/pull/15?utm_source=github" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/review-in-cubic-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/review-in-cubic-light.svg"><img alt="View guided diff" src="https://www.cubic.dev/buttons/review-in-cubic-light.svg"></picture></a> <a href="https://www.cubic.dev/action/auto-fix/pr/RunanywhereAI/trnrt/15?returnTo=https%3A%2F%2Fgithub.com%2FRunanywhereAI%2Ftrnrt%2Fpull%2F15&source=description" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/turn-on-auto-fix-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/turn-on-auto-fix-light.svg"><img alt="Turn on auto-fix" src="https://www.cubic.dev/buttons/turn-on-auto-fix-light.svg"></picture></a>

<!-- End of auto-generated description by cubic. -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c58bd113fdf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.