# Issue

**Title:** Pre-release 1.7.0

## Description

Release MOABB 1.7.0.

### Version
- `moabb.__version__`: `1.7.0dev0` → `1.7.0`
- update `CITATION.cff`, `README.md`, and `docs/source/cite.rst`
- set release date to 2026-08-31

### Changelog
- mark Version 1.7 as stable
- open the Version 1.8 development section
- include #1169: use cached processing data before NEMAR prefetch, including offline and concurrent-cache-removal behavior
- include #1168: make dataset bubble plot layouts reproducible, with contributor credit for Anna Sokolova

### Validation
- all CI checks for #1168 and #1169 passed on Ubuntu, macOS, and Windows
- plotting tests passed: 166 passed, 2 skipped
- pre-commit passed for all release files and merged plotting files
- `cffconvert --validate` passed
- wheel and sdist built successfully with version 1.7.0 metadata

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99835a46a306`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.