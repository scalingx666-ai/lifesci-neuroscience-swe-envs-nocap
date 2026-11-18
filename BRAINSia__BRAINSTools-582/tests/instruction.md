# Issue

**Title:** BUG: Fix CI masking test failures; exclude BCD checker tests

## Description

## Problem

Two bugs observed in PR #569 CI run [24005367440](https://github.com/BRAINSia/BRAINSTools/actions/runs/24005367440/job/70008094266?pr=569):

### Bug 1 — `continue-on-error: true` masked test failures

The `ExperimentalTest` step had `continue-on-error: true`, which caused the GitHub Actions status check to show **green** even when tests failed. `BRAINSFitTest_RigidRotationNoMasks` failed but the PR appeared to pass.

`ExperimentalSubmit` already uses `if: always()` so CDash receives failure data regardless of the test step exit code — `continue-on-error` is not needed and actively harms visibility.

**Fix:** Remove `continue-on-error: true` from the test step.

### Bug 2 — BCD checker tests aborted with "Subprocess aborted"

`-E '^BCD'` excluded `BCDTest_*` but not the six companion checker tests:
```
chk_BCDTest_ForceRPPoint
chk_BCDTest_ForceACPoint
chk_BCDTest_ForcePCPoint
chk_BCDTest_ForceVN4Point
chk_a_BCDTestForLandmarkCompare
chk_i_BCDTestForLandmarkCompare
```
These tests check output files produced by the excluded BCD tests. With no output file they abort with "Subprocess aborted", polluting CDash with false failures.

**Fix:** Widen the regex to `'^(BCD|chk_.*BCD)'` and add the six checker tests to `CTEST_CUSTOM_TESTS_IGNORE` in `CTestCustom.cmake.in`.

## Changes

- `.github/workflows/build.yml`: remove `continue-on-error`; widen `-E` pattern
- `CMake/CTestCustom.cmake.in`: add 6 checker tests to `CTEST_CUSTOM_TESTS_IGNORE`

## AI disclosure

Diagnosed and fixed with Claude Code (Sonnet 4.6). Root causes identified by reading the CI log from run 24005367440 and the existing workflow configuration.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9a8da1b6b72`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.