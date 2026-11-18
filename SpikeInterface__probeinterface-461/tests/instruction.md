# Issue

**Title:** Accept plane names for the axis argument of Probe.rotate

## Description

The docstring of `Probe.rotate` documents `axis` as one of `"xy"`, `"yz"`, or `"xz"`, but passing any of those strings raises `ValueError: could not convert string to float: 'xy'`. Only a 3-element vector actually works today, so the documented form of the argument has never been usable.

The cause is that `rotate` forwards `axis` straight to `_rotation_matrix_3d`, which immediately does `axis = axis / np.linalg.norm(axis)`. `np.linalg.norm` calls `astype(float)` on its input, and a string cannot be cast, so the call dies before the rotation matrix is ever built.

This adds a small `_axis_to_vector` helper that normalises the argument before it reaches `_rotation_matrix_3d`. A plane name maps to the unit vector normal to that plane, so `"xy"` becomes `[0, 0, 1]`, `"yz"` becomes `[1, 0, 0]`, and `"xz"` becomes `[0, 1, 0]`, which is the mapping Alessio suggested in the issue thread. Vectors keep working exactly as before, and anything else now raises a `ValueError` that names the accepted values instead of surfacing a numpy casting error. The type hint and docstring were updated to say that both forms are accepted.

Tested with new cases in `tests/test_probe.py`. They rotate the same 3D probe twice, once by plane name and once by the equivalent vector, and assert that contact positions and contact plane axes match, plus a check that rotating in the xy plane leaves z untouched and that bad axis values raise. All four new checks fail on main with the numpy casting error and pass with this change. The existing suite still passes, 193 passed and 1 skipped.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87410e103ca8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.