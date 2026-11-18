# Issue

**Title:** ENH: Replaced integer cast rounding methods with built in rounding functions.

## Description

Using `(int)(double_expression + 0.5)` to round can be inaccurate and slow.
Similar usages have been replaced with `lround`.
This implements the bugprone-incorrect-roundings clang-tidy check.
	-"Casting (double + 0.5) to integer leads to incorrect rounding; consider using lround (#include <cmath>) instead"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9637a823726a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.