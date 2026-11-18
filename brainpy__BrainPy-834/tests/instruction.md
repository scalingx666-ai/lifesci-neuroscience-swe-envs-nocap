# Issue

**Title:** Add typing for core utils, enable PEP 561, add mypy CI

## Description

## Summary

- **Enable PEP 561**: ship a `brainpy/py.typed` marker (declared via setuptools `package-data`) so downstream type checkers consume BrainPy's inline annotations. Verified the built wheel contains `brainpy/py.typed`.
- **Comprehensive, strict-mypy-clean typing** of a curated subset of the public "fundamental supporting" surface:
  - `brainpy/_errors.py`, `brainpy/types.py`
  - `brainpy/tools/{__init__,codes,dicts,functions,install,math_util,others,package,progress}.py`
- **mypy config** in `pyproject.toml`: lenient globally with `follow_imports = "silent"` so the large, JAX-based code base neither blocks nor pollutes the check, plus a strict per-module override for the curated set. The curated files are listed in `[tool.mypy].files`, so CI runs a bare `mypy`.
- **mypy CI**: new dedicated `.github/workflows/typecheck.yml` job (Linux, Python 3.13) and `mypy` added to `requirements-dev.txt`.

## Why curated-subset?

The package is ~74K LOC with ~3% return-type coverage today; full strict-mypy coverage in one PR isn't feasible. This establishes the infrastructure (py.typed + mypy config + CI) and a strictly-typed, green-from-day-one core that can be grown incrementally by extending `[tool.mypy].files` (and the override `module` list).

## Verification

- `mypy` → `Success: no issues found in 11 source files`.
- Built wheel contains `brainpy/py.typed`.
- Existing tests pass (`brainpy/tools/functions_test.py`); smoke-tested all touched modules incl. `Progbar` in every verbose mode.
- All edits are type-only — no runtime behavior changes.

## Summary by Sourcery

Introduce static type checking infrastructure and annotations for core BrainPy utilities and errors while keeping runtime behavior unchanged.

Enhancements:
- Add type annotations and mypy-clean typing to core utility modules including tools, errors, and type aliases.
- Enable PEP 561 by shipping a py.typed marker so downstream projects can consume BrainPy's inline type hints.
- Configure mypy in pyproject.toml to strictly check a curated subset of modules while keeping global settings lenient for the rest of the codebase.

CI:
- Add a GitHub Actions workflow to run mypy against the curated strictly-typed subset on every push and pull request.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dccad83ba192`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.