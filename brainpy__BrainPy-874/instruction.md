# Issue

**Title:** chore(release): 2.8.2

## Description

## Summary
- Bump version to 2.8.2 (`brainpy/_version.py`)
- Fix the Codecov coverage badge, which was stuck showing "unknown" — Codecov's project settings still pointed at the retired `master` branch after the `main` rename in #870; adding `codecov.yml` with `codecov.branch: main` fixes it
- Fix invalid toctree link syntax in `docs/api.rst` (double backticks → single backtick for the `brainpy.state` external link entry)
- Add the 2.8.2 changelog entry

## Test plan
- [x] `brainpy/_version.py` reads `2.8.2`
- [x] Verified via Codecov's public API that the repo's stored default branch was `master` while `main`'s latest processed commit report was missing — root cause of the "unknown" badge
- [x] CI on this branch

## Summary by Sourcery

Prepare the 2.8.2 maintenance release with updated versioning, documentation, and coverage configuration.

Bug Fixes:
- Correct the `docs/api.rst` toctree link syntax for the `brainpy.state` entry so it renders as a working external link.

Enhancements:
- Add a detailed 2.8.2 changelog entry describing compatibility, documentation, and tooling changes.

Build:
- Bump the recorded package version to 2.8.2 in `brainpy/_version.py`.
- Add `codecov.yml` to pin the default tracked branch to `main` and ensure the coverage badge reports correctly.

Documentation:
- Update the changelog with the 2.8.2 release notes, including bug fixes and tooling changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `49204d078a16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.