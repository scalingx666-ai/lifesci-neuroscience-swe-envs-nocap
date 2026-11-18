# Issue

**Title:** CI: Fix documentation deployment

## Description

## Summary
- remove the direct push trigger from docs workflow
- keep docs deploys gated by workflow_run completion of Build-Test-Deploy
- preserve pull_request preview docs builds and manual dispatch

## Why
The removed push block had inverted semantics and was confusing. Deploy should happen only after successful Build-Test-Deploy, for master pushes and tag pushes via workflow_run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf117cb38c40`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.