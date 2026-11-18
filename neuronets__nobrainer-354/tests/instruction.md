# Issue

**Title:** feat: support Python 3.12+ for Google Colab compatibility

## Description

## Summary

- Lower `python_requires` from `>= 3.13` to `>= 3.12` for Colab compatibility
- Add Python 3.12 to CI test matrix and classifiers

Google Colab currently runs Python 3.12.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `beda2eba40bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.