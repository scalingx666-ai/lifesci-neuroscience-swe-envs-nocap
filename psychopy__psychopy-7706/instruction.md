# Issue

**Title:** BF: Fix AttributeError from removed np.unicode_ in isValidVariableName

## Description

## Summary

`isValidVariableName()` in `psychopy/data/utils.py` referenced `np.unicode_`, which was removed in NumPy 2.0 (`np.str_` is the replacement). This is one of a handful of leftover NumPy-2-removed-API references from the Python 3.12/NumPy 2 migration ( for the `np.NaN` equivalent).

The reference was in the `except` branch that's meant to handle a variable name whose `str(name)` conversion fails, so instead of raising the intended `ConditionsImportError` ("contains non-ASCII characters"), it crashed with an unrelated `AttributeError: `np.unicode_` was removed in the NumPy 2.0 release`.

While writing a regression test for that, I found the branch's own error-message formatting had the same underlying problem: both branches built their message with `"...%s..." % (name, type(name))`, and `%s` formatting calls `str()` on `name` -- exactly the call that had just failed. So even after fixing the `np.unicode_` reference, this path still crashed, just with the original (unwrapped, unhelpful) exception instead of a clean `ConditionsImportError`. Fixed by using `repr(name)` for the message instead, which can't fail here. Also fixed the untranslated message for the "could not be converted" case, which was missing its `%` formatting entirely and so always displayed the raw `%s (type %s)` template unfilled.

## Test plan

- [x] Added `test_isValidVariableName_str_conversion_failure` in `psychopy/tests/test_data/test_utils.py`, using a `str` subclass with a `__str__` that raises, to exercise this except-branch.
- [x] Verified the new test fails on the pre-fix code with the exact reported `AttributeError`, and passes after the fix.
- [x] Full `psychopy/tests/test_data/` suite passes (151 passed, 4 skipped).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `84a5b87d6db6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.