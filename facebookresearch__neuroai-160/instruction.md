# Issue

**Title:** Remove duplicate _get_max_length method in HuggingFaceText

## Description

## What

Removes a duplicated `_get_max_length` definition in `HuggingFaceText` (`neuralset-repo/neuralset/extractors/text.py`). The method was defined twice with byte-identical bodies.

## Why

Python keeps only the second definition, so the first was dead code. It slipped in via PR #147 and isn't caught by linting: ruff (F811) and pylint (E0102) both skip redefinitions of underscore-prefixed names by default.

## Change

- Deleted the first of the two identical definitions (18 lines).
- No behavior change: the surviving method is identical, and the sole call site (`_get_data`) is untouched.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96244f0ef4d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.