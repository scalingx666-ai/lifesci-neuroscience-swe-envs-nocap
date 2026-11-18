# Issue

**Title:** Build: Fix dependency fetch; add freecache

## Description

This has two fixes for the build script:

- Fixed a typo in `install-developer-dependencies.sh` (I have no idea how this typo made its way into PR #239)
- Added `freecache` dependency

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/245)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `51e31d2e1a6d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.