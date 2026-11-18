# Issue

**Title:** fix(query): judge page validity on the vault calendar

## Description

## Summary

`is_current()` used the machine's local date by default. That could expire an
inclusive `valid_until` one day early when the host date was ahead of the vault
calendar.

- Use the shared vault clock for the default UTC day.
- Have retrieval pass the day in the vault's configured `timezone:`.
- Keep explicit `--as-of` behavior and the response's null default `as_of`
  unchanged.

```text
local=2026-11-10 utc=2026-11-09 is_current=False
```

## Verification

Python 3.12:

```text
.venv\Scripts\python.exe -m pytest tests/test_temporal.py tests/test_graphrag.py tests/test_evaluate.py tests/test_links.py tests/test_lint.py tests/test_client.py tests/test_okignore_commands.py -q
228 passed

git diff --check
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `513c65ebb7e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.