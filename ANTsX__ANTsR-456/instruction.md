# Issue

**Title:** CI: restore Python dependencies and verify image setters

## Description

## Summary

- Install compatible Python dependencies for existing Python-dependent tests in both workflows.
- Verify image setters through the resulting metadata and use a portable temporary path in the SIMLR round-trip test.
- Add a time-limited Windows installation diagnostic and upload logs to investigate the existing build stall.

No tests or platforms are removed. The Windows diagnostic is not yet a confirmed fix.

## Validation

- Local test suite: 380 expectations passed, no failures or errors.
- Local coverage and vignette build are still being verified.
- GitHub Actions checks on all platforms are pending.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `66ac869b35ac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.