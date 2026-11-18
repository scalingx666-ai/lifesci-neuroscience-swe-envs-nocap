# Issue

**Title:** fix(research): stop on contradicted evidence

## Description

## Summary
- require evidence-addressable claims, material counterevidence, and stop-the-line handling for invalidated work
- make PI synthesize exploratory artifacts before binding protocols and keep Experimentalist diagnostics decision-capable
- make Auditor reject protocol conformance built on invalidated premises
- repair persisted Pi fd/rg executable bits and preinstall fd-find in CPU/GPU sandboxes

## Verification
- npm run build
- npm run typecheck
- npm test (105 files, 1113 tests)
- bash -n docker/sandbox/_python-base.sh
- git diff --check

Docker daemon access is unavailable in this environment, so the image itself was not built locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d19409c39959`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.