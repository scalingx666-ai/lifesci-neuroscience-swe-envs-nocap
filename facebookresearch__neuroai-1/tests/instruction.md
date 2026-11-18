# Issue

**Title:** docs(neuralfetch) + trigger CI on PRs

## Description

1. `docs/neuralfetch/install.md` — drops phantom `[dev,all]` extra, points tutorial users to `neuralset[tutorials]`

2. `.github/workflows/ci.yml` — fires CI on PRs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `023559898e32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.