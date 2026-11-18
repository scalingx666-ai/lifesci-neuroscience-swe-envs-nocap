# Issue

**Title:** Link the repository as RunanywhereAI/trnrt

## Description

The repo was renamed from `trnrt-glm` to `trnrt` (Sanchit's call, 4 Nov). This points clone commands, the CI badge, issue/advisory links, the release job's repository check (`github.repository == 'RunanywhereAI/trnrt'`, without it releases would be skipped) and the package URLs at the new name. Same 8 files as #11, reversed. GitHub redirects the old URL, but the release-job check needs the exact name.

<!-- This is an auto-generated description by cubic. -->
---
## Summary by cubic
Updates all repository references from the old `trnrt-glm` name to the new `RunanywhereAI/trnrt` after the repo rename, and links the GLM-5.3-Flash on Trainium2 blog post in the README.

- Fixes clone commands, CI badge, issue/advisory links, package URLs, and the release job's repository check.
- The release job check needs the exact repository name; GitHub redirects the old URLs for everything else, but without the update releases would be skipped.

<sup>Written for commit 7a0233462feb4940cb3c3999d6e23263be975edf. Summary will update on new commits.</sup>

<a href="https://cubic.dev/pr/RunanywhereAI/trnrt/pull/12?utm_source=github" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/review-in-cubic-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/review-in-cubic-light.svg"><img alt="View guided diff" src="https://www.cubic.dev/buttons/review-in-cubic-light.svg"></picture></a> <a href="https://www.cubic.dev/action/auto-fix/pr/RunanywhereAI/trnrt/12?returnTo=https%3A%2F%2Fgithub.com%2FRunanywhereAI%2Ftrnrt%2Fpull%2F12&source=description" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/turn-on-auto-fix-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/turn-on-auto-fix-light.svg"><img alt="Turn on auto-fix" src="https://www.cubic.dev/buttons/turn-on-auto-fix-light.svg"></picture></a>

<!-- End of auto-generated description by cubic. -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `82603ecc1400`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.