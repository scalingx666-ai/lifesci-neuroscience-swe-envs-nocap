# Issue

**Title:** MRG: fix new interpolation errors with Scipy 1.6

## Description

Scipy >= 1.6.0 not longer guarantees that you get the same result when
interpolating directly (with map_coordinates, prefilter=True - the default) and
when using pre-calculated filters (map_coordinates, prefilter=False).

Therefore, we have to pad the calculated filter to get the same result.

See:

*
*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `473952b3cb2a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.