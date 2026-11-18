# Issue

**Title:** Restore the AttributeError for unknown names in moabb.pipelines

## Description

`from moabb.pipelines import *` dies with `TypeError: 'NoneType' object is not iterable` on 1.5.0. The module `__getattr__` raises for the eight tensorflow classes it deprecates and then just ends, so every other name comes back as `None`, `__all__` included. Python asks for `__all__` to do the star import, gets `None`, and tries to iterate it. The final `raise` was there untill #692 swapped the lazy-import body for the braindecode check. `moabb/datasets/__init__.py` still has its copy of that line, so I've used its wording rather than the exact string #692 dropped.

The quieter cases are probably the worse ones. A typo'd `from moabb.pipelines import Foo` binds `None` and theres no complaint at all, and a mistyped class name in a pipeline `.yml` comes back as `TypeError: 'NoneType' object is not callable` with nothing saying which name was wrong.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c228f6c7059`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.