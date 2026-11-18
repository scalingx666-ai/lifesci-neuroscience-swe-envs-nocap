# Issue

**Title:** BF: Defer psutil import warning and skip open-file checks when unavailable

## Description

## Overview

This PR addresses issues with premature warning messages about missing optional dependencies and ensures graceful degradation when `psutil` is not installed.

### Changes

1. **datalad/support/openfiles.py**
   - Added `can_detect_open_files()` function with `@lru_cache` decorator to check psutil availability
   - Moved the psutil import warning from module load time into this function, so it only warns once when actually needed
   - This prevents spurious warnings during normal operations when open-file detection isn't being used

2. **datalad/support/gitrepo.py**
   - Updated `_check_for_openfiles()` to skip open-file detection when `can_detect_open_files()` returns False
   - Imported the new `can_detect_open_files()` function

3. **datalad/cli/tests/test_main.py**
   - Enhanced `test_script_shims()` to verify that script invocations produce no warnings
   - Set `DATALAD_LOG_LEVEL='WARNING'` in subprocess environment to catch any warnings
   - Added assertion that stderr is empty, ensuring no unexpected warnings are emitted

### Rationale

Previously, the absence of `psutil` would trigger a warning at module import time, even if open-file detection was never used. This caused warnings to appear in unrelated operations and in test output. By deferring the warning until the functionality is actually needed and caching it, we:
- Only warn users who actually attempt to use open-file detection
- Warn only once per process
- Allow graceful degradation when the optional dependency is missing
- Keep test output clean

### Test Plan

Existing tests pass, including the enhanced `test_script_shims()` which now verifies that script invocations produce no spurious warnings.

https://claude.ai/code/session_01RvWCa3p3NLdEgPUBcYvKCu

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd8273d0b08a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.