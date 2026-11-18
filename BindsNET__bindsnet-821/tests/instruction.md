# Issue

**Title:** Keep CLAUDE.md off GitHub

## Description

CLAUDE.md holds notes for Claude Code sessions; it is now ignored by git and kept in the maintainer's private backup.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ea151ecdb2a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.