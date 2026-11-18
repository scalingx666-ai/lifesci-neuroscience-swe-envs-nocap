# Issue

**Title:** CI: Prepare for Python 3.15 and replace deprecated os.path.commonprefix

## Description

### Overview

This PR updates DataLad to support Python 3.15 and addresses deprecation warnings by replacing uses of `os.path.commonprefix()`, which is deprecated in Python 3.15.

### Changes

1. **Python version support updates:**
   - Updated CI test matrix to test against Python 3.15 (newest pre-release) instead of 3.14
   - Added Python 3.14 as a cron-only test job to maintain coverage
   - Enabled `allow-prereleases` in GitHub Actions setup-python to handle pre-release versions
   - Updated `pyproject.toml` classifiers to explicitly list supported Python versions 3.10-3.15

2. **Replaced deprecated `os.path.commonprefix()` calls:**
   - **`datalad/log.py`**: Replaced `os.path.commonprefix()` with a character-by-character comparison using `zip()` to find the common prefix length
   - **`datalad/utils.py`**: Replaced `commonprefix()` logic with direct `startswith()` checks, which is more semantically correct for path comparison
   - **`datalad/support/gitrepo.py`**: Removed unused `commonprefix` import and replaced its usage with `startswith()` for clearer path validation

### Rationale

`os.path.commonprefix()` is being deprecated in Python 3.15 because it operates on strings rather than paths, leading to unintuitive behavior (e.g., `/usr/bin` and `/usr/local/bin` share the prefix `/usr/` but not a meaningful path component). The replacements use more explicit and semantically correct approaches for each use case.

### Test Plan

Existing tests cover these code paths. CI will verify:
- All tests pass on Python 3.15 pre-release
- All tests pass on Python 3.14 (cron job)
- No deprecation warnings from `os.path.commonprefix()`

https://claude.ai/code/session_01CwFVWucBGUVTRUfqkYAzMF

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8357e625743e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.