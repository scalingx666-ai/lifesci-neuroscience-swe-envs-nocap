# Issue

**Title:** FIX: Don't crash on non-string BIDS filter values

## Description

.

## Changes proposed in this pull request

- Replace `not isinstance(value, Query)` with `isinstance(value, str)` in `_process_value` (`fmriprep/config.py`, called during `--bids-filter-file` unserialization).

## Why

`_process_value` was checking `'Query' in value` for any non-`Query` input, which raised `TypeError: argument of type 'int' is not iterable` whenever a filter value was an `int` or `float` (e.g. `{"inv": 2}` in the JSON filter file). Using `isinstance(value, str)` as the guard skips the substring check for non-string scalars, so they pass through unchanged.

The `Query`-passthrough behavior previously provided by `not isinstance(value, Query)` is preserved naturally: `Query` enum members are not instances of `str`, so the guard short-circuits and the value is returned unchanged.

## Testing

- Verified the fixed conditional locally against `int`, `float`, `bool`, plain strings, lists with mixed scalar types, `repr(Query.OPTIONAL)` (the existing Query-repr unserialize path), and existing `Query` instances. All pass through or unserialize as expected.
- `ruff check`, `ruff format --check`, and `codespell` pass on the modified file.

## Documentation that should be reviewed

None.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `acdb0fde1b8f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.