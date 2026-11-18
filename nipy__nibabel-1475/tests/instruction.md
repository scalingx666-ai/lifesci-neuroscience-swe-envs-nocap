# Issue

**Title:** chore/doc: Run style checks with pre-commit, update docs to match

## Description

This makes `tox -e style|spellcheck` simply call equivalent `pre-commit` commands, which removes the need for pinning.

I think pinning all dependencies in type checking is too important to only pin mypy, so I switched that to a local pre-commit hook.

Rendered docs: https://nibabel-draft--1475.org.readthedocs.build/en/1475/devel/devguide.html#testing

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e890407780ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.