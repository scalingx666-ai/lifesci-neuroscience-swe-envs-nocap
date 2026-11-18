# Issue

**Title:** BF: Fix AttributeError from removed np.unicode_ in isValidVariableName

## Description

Backport of #7706 to `release`, as requested by @TEParsons (), so the fix reaches users in the next release rather than waiting for `dev` to roll forward.

## Summary

`isValidVariableName()` in `psychopy/data/utils.py` referenced `np.unicode_`, which was removed in NumPy 2.0 (`np.str_` is the replacement). The reference lived in the `except` branch meant to handle a variable name whose `str(name)` conversion fails, so instead of raising the intended `ConditionsImportError`, it crashed with an unrelated `AttributeError: np.unicode_ was removed in the NumPy 2.0 release`.

The same branch's message formatting had a related problem: both branches built their message with `"...%s..." % (name, type(name))`, and `%s` calls `str()` on `name` — exactly the call that had just failed — so the path still crashed even after fixing `np.unicode_`. Fixed by formatting with `repr(name)` (via `safeName`), which cannot fail here. Also fixed the untranslated message for the "could not be converted" case, which was missing its `%` formatting entirely and so displayed the raw `%s (type %s)` template unfilled.

This is a clean cherry-pick of 511340f47 (from #7706); it applies to `release` with no conflicts.

## Test plan

- [x] `test_isValidVariableName_str_conversion_failure` in `psychopy/tests/test_data/test_utils.py` uses a `str` subclass whose `__str__` raises, to exercise this except-branch.
- [x] Verified the test fails on the pre-fix `release` code with the reported `AttributeError` and passes after the fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `707be2fbf06c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.