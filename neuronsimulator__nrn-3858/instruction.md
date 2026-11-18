# Issue

**Title:** neuronapi: expose property data-handle validity

## Description

An unset or opaque NMODL `POINTER` has an empty data handle, and the six `nrn_property_*` value accessors report that as NaN (). NaN is also a perfectly good double, so a caller receiving one cannot tell an absent handle from a legitimately stored NaN.

This adds `nrn_property_data_handle_is_valid()`, which resolves the same data handle as the existing accessors and reports whether it is non-empty.

It is deliberately a **second-line** check. The value accessors are unchanged, so the common path still costs one call; a caller consults this predicate only after seeing NaN and needing to distinguish the two cases. That keeps the one-call common path we discussed, rather than making every read pay for a validity check.

This does not change #3855 or stack on it.

## Test

Tests assert the distinction rather than the happy path:

- unset point-process `POINTER` -> false
- ordinary scalar storage -> true
- a deliberately stored NaN -> still true (this is the case the predicate exists for)
- two wired `POINTER`s -> true
- every element of VClamp's three-element `amp` array -> true

Note on `i`: it selects the element for a point-process array property. It is ignored for a scalar property and for an object that is not a point process, whose storage is present or absent as a whole rather than per element. The parameter docs say so.

Verified on an `NRN_ENABLE_PYTHON=OFF` build: the full `api::` suite passes (15/15), `git diff --check` clean, pinned clang-format 12.0.1 / cmake-format 0.6.13 produce no changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67fb8c6e8eaa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.