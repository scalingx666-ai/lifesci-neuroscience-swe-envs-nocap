# Issue

**Title:** Fix CI (Python + MATLAB) and three small bugs in stats

## Description

## Summary

Brings CI back to green (Python + MATLAB suites have been red on master) and folds in three high-severity correctness fixes from a recent audit. All 9 required checks now pass on this branch.

### CI

**Python tests** (`unittests` matrix) — were aborting at test collection with `ModuleNotFoundError: No module named 'pkg_resources'`. Investigation produced a chain of issues:
1. Default setuptools on Python 3.11/3.12 is now ≥81, which dropped `pkg_resources`. abagen 0.1.3 still imports `pkg_resources`.
2. Pinning `setuptools<81` exposed a numpy 2.x regression: `float(size_1_array)` raises `TypeError: only 0-dimensional arrays can be converted to Python scalars`.
3. abagen 0.1.3 also calls `DataFrame.groupby(sid, axis=1)` which pandas 2.1 removed.
4. Pinning `pandas<2.1` resolves to pandas 2.0.x whose C extensions were built against numpy 1.x ABI → `numpy.dtype size changed` at import.
5. pandas 2.0.x has no Python 3.12 wheels and cannot be built from source there.

Fixes:
- Bumped `actions/checkout@v4` and `actions/setup-python@v5`.
- Pinned `setuptools<81` (with re-install after the editable install in case it gets bumped back).
- Pinned `numpy<2,>=1.21` and `pandas<2.1,>=1.3` in both `setup.py` and `requirements.txt` so the entire stack stays on numpy-1.x ABI until abagen drops `pkg_resources`/`groupby(axis=)`.
- Replaced `float(np.sqrt(... / vf))` with `.item()` in `_t_test.py:175` — works on numpy 1.x and 2.x.
- Dropped Python 3.12 from the matrix (incompatible with the `pandas<2.1` pin); added a comment so it can be re-added once abagen is patched.

**MATLAB tests** (`matlab_unit_test` matrix) — every `test_precomputed/*` errored with `MATLAB:Python:PythonUnavailable` because the workflow installed Python 3.8 but never told MATLAB about it via `pyenv`. Plus `matlab-actions/setup-matlab@v0` is end-of-life.
- Bumped to `matlab-actions/setup-matlab@v2` and `matlab-actions/run-command@v2`; `pyenv('Version', ...)` is now called before `runtests`.
- Switching to `run-command` lost the implicit `addpath` from `run-tests`, so added `addpath(genpath('brainstat_matlab'))` explicitly.
- Pair MATLAB versions with compatible Python: `R2022a` ↔ `3.9`, `latest` ↔ `3.10`. Dropped the unsupported `R019b` matrix entry (setup-matlab v2 needs R2020a+).

### Bugs

- `brainstat/stats/SLM.py` — `from cmath import sqrt` was importing the complex square root. Switched to `math.sqrt`.
- `brainstat/stats/SLM.py` — `fetch_template_surface` was being imported twice; kept the higher-level one.
- `brainstat/stats/_t_test.py` — `sys.exit(...)` would kill the host process when contrast is non-estimable. Replaced with `raise ValueError(...)`.

## Test plan
- [x] `python -m pytest brainstat/tests/test_t_test.py` — 16/16 pass locally.
- [x] All 9 CI checks pass: Python 3.10/3.11 × ubuntu/macos/windows, MATLAB R2022a/latest.
- [ ] Lift the numpy/pandas/3.12 pins once abagen drops `pkg_resources` and the `groupby(axis=)` call.

## Follow-ups (not in this PR)
- File an upstream issue against abagen tracking the `pkg_resources` and `groupby(axis=)` removals so the pins here can come off.
- Consider re-enabling the commented-out `mypy` job after #199 unblocks.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a820d015c780`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.