# Issue

**Title:** Replace deprecated parseAll argument with parse_all in parse_statement

## Description

This changes `parseAll=True` to `parse_all=True` in `parse_statement` (`brian2/parsing/statements.py`).

pyparsing 3.3 deprecated the `parseAll` argument, so this call was producing a lot of `PyparsingDeprecationWarning`s in the test output.

#1714 and b32d4c9 already made this change in `equations.py` and `explicit.py`, but this call in `statements.py` was left over. Since `pyproject.toml` requires `pyparsing>=3` and `parse_all` exists from 3.0.0, it works with all supported versions.

I ran `brian2.test('numpy')` locally (Python 3.12, pyparsing 3.3.3) and all tests pass. The warning counts went from 84 to 14, 388 to 38, and 1153 to 14, with no pyparsing warnings left.

Note: #1804 also changes the `except` line just below this one, so one of the two PRs may need a small rebase.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `199864f786bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.