# Issue

**Title:** BF: Exclude complex infinities from finite_range

## Description

`finite_range` explicitly supports complex arrays, but its fast path tests extrema against real +/- infinity. A complex value such as `inf+1j` is unequal to real infinity, so it is incorrectly accepted as finite. An infinite imaginary component can leak into the reported range in the same way.

Use `isfinite` for both extrema before taking the fast path. Extend the existing parameterized range tests with positive/negative real infinities, an infinite imaginary component and an all-nonfinite complex array; the existing checks exercise both return signatures and flattened inputs.

Validation: the four new cases fail on the original implementation while 21 finite-range controls pass. After the fix, the scaling, arraywriter and volumeutils test modules pass (106 passed, 68 numeric cast/overflow warnings in existing tests). Ruff lint and formatting checks and git diff --check pass. Python 3.12.14 and NumPy 2.5.4. The full package suite was not run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdacbf05c15f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.