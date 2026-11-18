# Issue

**Title:** Fix `linspace` and `where` dropping units when a plain `0` is combined with a quantity

## Description

Brian treats a plain `0` as compatible with any dimensions (`fail_for_dimension_mismatch`), but the unit-aware `linspace` and `where` took the dimensions of the result from their first argument only. `linspace(0, 10*ms, 5)` and `where(cond, 0, v_mV)` therefore returned unitless arrays holding SI values, while `linspace(0*ms, 10*ms, 5)` and `where(cond, v_mV, 0)` worked. In practice, `G.v = linspace(0, 10*mV, N)` fails with a confusing `DimensionMismatchError`, and `where(cond, 0, v_mV)/mV` silently has dimensions of 1/volt instead of being dimensionless.

A small helper now takes the dimensions of the second argument when the first one is dimensionless. It is called after the mismatch check, so this can only happen when the first argument is a zero. Behaviour is unchanged in all other cases, and `linspace(1, 2*mV)` still raises. Related to #872, which is about other numpy functions losing units.

Tests: `test_arange_linspace` and `test_special_case_numpy_functions` are extended (plain `0` in either position, an array of zeros, and the error case). The previous `where` test compared `np.asarray` values only, which is why this was not caught. Both extended tests fail on master and pass with this change. `test_units.py`, `test_functions.py`, `test_timedarray.py`, `test_spikegenerator.py`, `test_morphology.py` and `test_neurongroup.py` on runtime targets: no new failures (Python 3.13, numpy 2.5).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a88d9f15fb88`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.