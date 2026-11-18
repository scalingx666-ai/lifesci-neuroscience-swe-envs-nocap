# Issue

**Title:** fix(research): diagnose decision-critical assumptions

## Description

## Summary
- make canonical data inventories include bounded structure-aware variation without selecting methods or causal explanations
- require Experimentalist to map decision-critical assumptions to evidence and route bounded diagnostics before freezing methods
- preserve the updated method-selection contract in legacy persona overrides

## Verification
- npm run build
- npm run typecheck
- npm test (105 files, 1113 tests)
- git diff --check

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a9656a4bcc88`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.