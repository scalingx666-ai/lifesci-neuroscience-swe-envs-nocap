# Issue

**Title:** CI add dev branch to CI/CD workflows and README badges

## Description

## Summary
Updated CI/CD workflows and documentation to include the `dev` branch alongside `main` for automated testing, building, and spell-checking.

## Changes
- **Workflows**: Added `dev` branch to trigger conditions for:
  - Codespell (spell-checking)
  - Build docs
  - Install from wheel
  - Run tests
- **Documentation**: Updated codecov badge in README.md to track coverage for the `dev` branch instead of `main`

## Details
These changes enable continuous integration checks to run on both the `dev` and `main` branches, supporting a development workflow where the `dev` branch serves as an integration branch before merging to `main`. The codecov badge now reflects coverage metrics from the `dev` branch, which is the primary development target.

https://claude.ai/code/session_0133yjEZobSSkwp1tfxC7Jsj

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e4c0790b66b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.