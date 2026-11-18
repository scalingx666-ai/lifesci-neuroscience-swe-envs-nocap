# Issue

**Title:** Upgrade yarn to 4.18.1 and express in version visualizer

## Description

### Summary
Instead of merging the dependatbot security fix in PR #10291, I updated the package correctly instead of just the `yarn.lock` file.

- Upgrade Yarn from 4.17.1 to 4.18.1 (no breaking changes; node-modules linker fixes, ). The root `yarn.lock` is unchanged.
- Pin `packageManager` in `tools/postgres` and `tools/debugging/version-visualizer` so Corepack picks the same Yarn there.
- Bump `express` to `^5.3.0` in the version visualizer. That raises the transitive `body-parser` to 2.4.0, which includes the GHSA-27r3-jxmh-p828 fix. Supersedes #10291.

### Steps to test:
- `corepack enable && yarn install` should fetch Yarn 4.18.1
- `node tools/debugging/version-visualizer/server.js` serves on :9999

------
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9e564d2116f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.