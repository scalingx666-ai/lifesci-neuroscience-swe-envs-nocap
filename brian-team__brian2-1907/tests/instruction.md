# Issue

**Title:** Remove docstring entries for parameters that are not accepted

## Description

Four docstrings list parameters that the function does not take:

- `Network.get_states` documents `vars` (and the `subexpressions` entry says it is ignored when `vars` is given), but the method has no such argument, so `net.get_states(vars=['v'])` raises `TypeError: Network.get_states() got an unexpected keyword argument 'vars'`. I removed the entry, moved the "all state variables except internal ones" sentence to the description, and reworded `subexpressions` to what it does here. I also fixed the doubled period in "network..".
- `Equations.check_units` documents `level`; the signature is `(group, run_namespace)`.
- `FunctionImplementationContainer.add_numpy_implementation` documents `function`; the method works on the container's own function and takes `wrapped_func` first.
- `BrianObjectException` documents `original_exception`; the constructor takes `(message, brianobj)` and callers use `raise ... from exc`.

This only touches docstrings. I checked the signatures and the `subexpressions=True` behaviour against brian2 2.10.1 from PyPI, and `ruff check` / `ruff format --check` (v0.14.2, as in the pre-commit config) pass on the changed files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb545b02f75d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.