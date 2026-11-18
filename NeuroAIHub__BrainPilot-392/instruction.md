# Issue

**Title:** chore(runtime): bump Pi SDK to 0.80.7

## Description

## Summary

- pin the runtime to `@earendil-works/pi-coding-agent@0.80.7`
- refresh the lockfile so clean installs resolve the published `0.80.7` package
- keep the existing Azure Responses postinstall patch in place
- stay on the pre-`ModelRuntime` SDK contract before the incremental migration in #391

The lockfile topology changes because the previous Pi entry had no registry resolution or integrity metadata. Regenerating it moves the published package to the normal npm workspace layout.

## Verification

- `npm ci`
- confirmed installed Pi version is `0.80.7`
- Azure patch applied during postinstall
- `npm run typecheck`
- `npm test` — 75 files, 852 tests
- `npm run build --workspace @brainpilot/runtime`

Related to #288 and #391. This PR does not remove the local Azure patch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c597f5cad4e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.