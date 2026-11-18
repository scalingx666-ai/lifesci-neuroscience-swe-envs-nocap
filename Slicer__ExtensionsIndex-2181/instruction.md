# Issue

**Title:** [5.8] ENH: Update pre-commit hooks

## Description

Backport from 

---

- [pre-commit/pre-commit-hooks: v4.5.0 -> v5.0.0](https://github.com/pre-commit/pre-commit-hooks/compare/v4.5.0...v5.0.0)
- [pre-commit/mirrors-prettier: v3.1.0 -> v4.0.0](https://github.com/pre-commit/mirrors-prettier/compare/v3.1.0...v4.0.0)
- [python-jsonschema/check-jsonschema: 0.28.0 -> 0.33.0](https://github.com/python-jsonschema/check-jsonschema/compare/0.28.0...0.33.0)

---

This pull-request was generated running steps adapted from the [pre-commit-autoupdate][1] GitHub action workflow found in the Slicer project.

[1]: https://github.com/Slicer/Slicer/blob/main/.github/workflows/pre-commit-autoupdate.yml

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d92e6561508f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.