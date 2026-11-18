# Issue

**Title:** Update outdated comment on the "Script error." toast suppression

## Description

### Summary
The comment explaining why we don't show a toast for `Script error.` blamed antd + Safari ResizeObserver errors. That's no longer the case: current WebKit reports ResizeObserver loop errors with their real message, which `BLACKLISTED_ERROR_MESSAGES` already filters. `Script error.` now only comes from cross-origin scripts (e.g. browser extensions), since our own code is a same-origin module script. Suppressing the toast is still correct, so this PR only rewrites the comment. No behavior change.

### Steps to test:
- No behavior change, comment only.

### Issues:
-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `512e32d03233`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.