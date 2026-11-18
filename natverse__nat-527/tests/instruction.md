# Issue

**Title:** ci: bump lagging GitHub Actions to current majors

## Description

## Summary

Three actions in `.github/workflows/` were behind their current major version. This PR brings them up to date.

| Action | Before | After | Notes |
|---|---|---|---|
| `actions/checkout` | `@v4` | `@v6` | Node 20 → 24 internals; drop-in |
| `actions/upload-artifact` | `@v4` | `@v7` | Drop-in for the single-artifact failure upload here |
| `codecov/codecov-action` | `@v4` | `@v7` | Also renames deprecated `file:` input to `files:` per v5+ schema |

`r-lib/actions` and `r-hub/actions` intentionally use rolling major tags (`@v2` / `@v1`), so those are correct as-is and not touched.

## Test plan

- [x] No workflow-syntax changes beyond version bumps and the documented `file:` → `files:` rename
- [ ] CI green on this PR (the workflows run on every push/PR, so the bumps validate themselves)
- [ ] Codecov upload still works — visible on the codecov check

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf82fad17fe7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.