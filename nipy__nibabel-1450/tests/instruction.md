# Issue

**Title:** BF - Fix io_orientation to process input axes by strength

## Description

This PR introduces changes aiming to make the axis assignment based on image affines more consistent. Instead of iterating over the axis in order `range(p)`, the axis are now iterated over based on the `strongest` axis according to the rotation-shear matrix (RS). 

Alternative implementation:
Add a parameter to `io_orientation` called `sort_by_strength` which would activate this new sorting method, while preserving the old behavior. This parameter should then be propagated to `as_closest_canonical` and other places that might need it. In my opinion this might introduce more complexity and make it harder to maintain. 

Notes:
In principle the sorting could be done based on the rotation matrix `R` instead of `RS`. However this causes `test_io_orientation` to fail due to the check when additional columns are added to the affine.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `249f6fbae82c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.