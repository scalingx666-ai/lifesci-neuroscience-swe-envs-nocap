# Issue

**Title:** BF: pytest plugin must not veto pytest's own directory filtering

## Description

`pytest_ignore_collect` returns `False` for every directory. The hook is declared `firstresult=True`, and entry-point plugins are called before pytest's builtin one, so that `False` vetoes pytest's own filtering — both `norecursedirs` and the `pyvenv.cfg` virtualenv check.

A bare `pytest` in a checkout therefore descends into `.venv/`, `.tox/` and `build/`. Collection *imports* what it finds, and `dill.__diff` replaces the builtin `__import__` process-wide, after which unrelated imports fail:

```
datalad/conftest.py:16: in <module>
    from unittest.mock import patch
.tox/lint/lib/python3.12/site-packages/dill/__diff.py:223: in _imp
E   ValueError: too many values to unpack (expected 2)
```

Return `None` for directories instead.

Verified with `.venv/` and `.tox/` present in the tree: `pytest --collect-only -q` → `1415 tests collected`, nothing under `.venv/`, `.tox/` or `build/`; on `maint` the same command aborts during collection. `pytest datalad/tests/test_pytest_plugin.py` → 9 passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8cc003160be5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.