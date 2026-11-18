# Issue

**Title:** ci: CodeQL through GitHub's default setup; drop the CodeQL workflow

## Description

Code scanning **default setup** is now on for the public repository: it ran on `main` at 18:00 UTC, with Python and Actions analyses uploaded. Its query suite is set to **extended**, matching the `security-extended` suite our workflow used.

GitHub rejects uploads from an advanced CodeQL workflow while default setup is on, so `.github/workflows/codeql.yml` would fail on its next run. This PR removes it and updates the CI table in `docs/DEVELOPMENT.md`.

Not merged: the decision is Sanchit's.

<!-- This is an auto-generated description by cubic. -->
---
## Summary by cubic
Drops the advanced CodeQL workflow now that GitHub's default setup handles code scanning on this public repository. Default setup runs the extended query suite against the Python code and workflows on every push and PR to main plus weekly; GitHub rejects uploads from the advanced workflow while default setup is on, so the workflow would fail on its next run. Updates the CI table in `docs/DEVELOPMENT.md` accordingly.

<sup>Written for commit 1da1cd00cd7c8ad700d6f36572d67da78e1dd47f. Summary will update on new commits.</sup>

<a href="https://cubic.dev/pr/RunanywhereAI/trnrt/pull/13?utm_source=github" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/review-in-cubic-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/review-in-cubic-light.svg"><img alt="View guided diff" src="https://www.cubic.dev/buttons/review-in-cubic-light.svg"></picture></a> <a href="https://www.cubic.dev/action/auto-fix/pr/RunanywhereAI/trnrt/13?returnTo=https%3A%2F%2Fgithub.com%2FRunanywhereAI%2Ftrnrt%2Fpull%2F13&source=description" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/turn-on-auto-fix-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/turn-on-auto-fix-light.svg"><img alt="Turn on auto-fix" src="https://www.cubic.dev/buttons/turn-on-auto-fix-light.svg"></picture></a>

<!-- End of auto-generated description by cubic. -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28abd3c35d8f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.