# Issue

**Title:** Move codespell config from .codespellrc to pyproject.toml

## Description

- Migrate all settings (skip, check-hidden, ignore-words-list) and comments to [tool.codespell] in pyproject.toml
- Replace .codespell-ignorelines exclude-file with inline `# codespell:ignore` pragma in test_run.py
- Add tomli dependency to pre-commit hook for Python <3.11
- Delete .codespellrc and .codespell-ignorelines

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `efedc0f12041`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.