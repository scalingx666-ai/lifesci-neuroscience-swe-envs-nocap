# Issue

**Title:** CI: fall back to ITKR v0.6.0.2.1 when the latest release lacks ITKR-release.zip

## Description

## Summary
. This commit was pushed to `docfix` after #443 had already been merged, so it missed the merge.

The Windows job installs ITKR from `releases/latest/download/ITKR-release.zip`. ITKR v0.6.1 (the current latest release) only publishes `ITKR-4.1.zip`, so that URL returns 404 and every Windows check fails at "Install ITKR binary".

The step now tries the latest release first and falls back to `v0.6.0.2.1` (`ITKR_FALLBACK_TAG`), which still has `ITKR-release.zip`:
- `releases/latest/download/ITKR-release.zip`: 404
- `releases/download/v0.6.0.2.1/ITKR-release.zip`: 200

Once ITKR publishes `ITKR-release.zip` again, the latest download succeeds and the fallback is no longer used. There is a pending ITKR fix that keeps the `ITKR-release.zip` / `ITKR-oldrel-1.zip` names.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9407f87fc36a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.