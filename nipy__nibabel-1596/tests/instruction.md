# Issue

**Title:** Validate SpatialHeader zooms are positive in space, non-negative in additional dimensions

## Description

Replaces #1595, which hit a persistent GitHub-side push error ("fatal error in commit_refs_rules") on the original branch name that a fresh branch name resolved. Same fix and tests as #1595, with the additional test-coverage fix (reset header shape before exercising zoom-value checks in test_shape_zooms, so the negative/zero zoom checks are actually exercised instead of being short-circuited by a stale ndim).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdacbf05c15f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.