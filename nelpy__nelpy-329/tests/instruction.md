# Issue

**Title:** Fix integer checks that never ran in rebin and replay scoring

## Description

`float(x).is_integer` without the call is a bound method and always truthy, so these checks never rejected anything.

BinnedEventArray.rebin silently truncated a non-integer `w` (2.5 -> 2, and 0.3 / 0.1 -> 2), returning the wrong bin width. It now rounds ratios that are whole numbers up to floating-point error and raises otherwise.

In analysis.replay, a non-integer `w` crashed later with a TypeError and a non-integer `n_shuffles` was silently truncated. Both now raise the intended ValueError, and integer-valued floats are accepted for `w`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80aa63d21880`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.