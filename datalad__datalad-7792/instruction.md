# Issue

**Title:** BF(CI): Fix extension tests for metalad and next

## Description

- Install libexempi-dev for datalad-metalad to fix test_xmp failures
- Skip test_existing_switch for datalad-next (see datalad/datalad-next#791)
- Add DL_PYTEST_OPTS variable to support extension-specific pytest options

🤖 Generated with [Claude Code](https://claude.com/claude-code)

The ultimate goal is to make CI fully green for a good baseline for testing anything new.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a7299a5f5ba9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.