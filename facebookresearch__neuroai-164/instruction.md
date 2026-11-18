# Issue

**Title:** Honor FmriCleaner.ensure_finite when other cleaning options are disabled

## Description

## Summary

. `FmriCleaner.clean()` only applied `ensure_finite` inside the `nilearn.signal.clean()` call, which was skipped when `detrend`, `standardize`, and filters were all off. So `NaN`/`Inf` leaked through despite `ensure_finite=True`, silently corrupting downstream models.

## Change

- Add `ensure_finite` to the guard so it's honored independently. Routing through nilearn keeps the logic in one place.
- Fix the docstring (it also zeroes `±Inf`).
- Add a test covering both on/off behavior.

Defaults are unaffected. `ruff` clean; new test fails without the fix, passes with it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cccc240991b4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.