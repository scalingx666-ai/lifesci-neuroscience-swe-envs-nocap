# Issue

**Title:** CI: allow Claude workflow to run uv commands

## Description

## Summary
- Adds `Bash(uv:*)` to the Claude Code workflow's `--allowed-tools`, so Claude can run `uv` commands without a prompt (alongside the existing `pytest` allowances).

## Test plan
- N/A — CI config change only.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e4f740150656`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.