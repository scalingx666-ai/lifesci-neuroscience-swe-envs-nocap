# Issue

**Title:** BF: Fail early when psutil is missing for skip-openfiles

## Description

## Overview

This change improves error handling for the `datalad.save.skip-openfiles` configuration option by failing early with a clear error message when `psutil` is not installed, rather than silently skipping the open-file detection check.

### Key Changes

1. **Early validation in `save_()`**: Added a check at the beginning of the `save_()` method that validates `psutil` availability when `datalad.save.skip-openfiles` is configured to anything other than `'none'`. This ensures the operation fails before modifying any files.

2. **Removed `can_detect_open_files()` function**: Deleted the `can_detect_open_files()` utility function from `openfiles.py` that only logged a warning. The explicit check in `save_()` provides better error handling with `external_versions.check()`.

3. **Simplified `_check_for_openfiles()`**: Removed the fallback check for `can_detect_open_files()` since the validation now happens earlier in the call stack.

4. **Updated imports**: Removed unused imports of `can_detect_open_files` from `gitrepo.py`.

5. **Enhanced test coverage**: Modified `test_save_openfiles()` to verify that:
   - When `psutil` is unavailable and `skip-openfiles` is configured, `save()` raises `MissingExternalDependency`
   - The repository state is not modified (config change is not saved) when the check fails
   - The error message clearly indicates how to resolve the issue

### Rationale

Previously, if `psutil` was missing, the code would silently skip open-file detection even when explicitly configured to check for open files. This could lead to incomplete files being saved without warning. The new approach:
- Fails fast with a clear, actionable error message
- Prevents partial state changes (the config modification is not saved)
- Makes the dependency requirement explicit rather than implicit

https://claude.ai/code/session_015ZswThG4Fnt5gjBWybUWPJ

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04120d1777fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.