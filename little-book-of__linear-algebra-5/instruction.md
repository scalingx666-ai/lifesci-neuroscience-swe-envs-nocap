# Issue

**Title:** General refactoring of code: new workflow based on Markdown Lint and `act` :recycle:

## Description

I propose to include a workflow to check the correct style of the Markdown code.

Files I added:

- `.markdownlint.json` for the lint configuration
- `.github/workflows/markdown-lint.yml` for the actual workflow

Files I modified:
- `README.md` using the `act` tool to write the correct Markdown code

Reference: https://github.com/nektos/act

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12f6e3a7008a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.