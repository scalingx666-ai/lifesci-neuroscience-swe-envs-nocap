# Issue

**Title:** Add auto-detection of T2* map and echo time units

## Description

## Summary

- Adds `check_t2s_values()` function to auto-detect if precalculated T2* maps are in seconds (per BIDS convention) or milliseconds
- Updates `check_te_values()` to prefer seconds per BIDS convention with deprecation warning for millisecond inputs
- Updates CLI help text for `-e` (echo times) and `--t2smap` to clarify expected units
- Applies unit validation when loading precalculated T2* maps in tedana workflow
- Adds `check_te_values()` to t2smap workflow for consistency

## Changes

### New function: `check_t2s_values()`
- Auto-detects T2* map units based on median non-zero values
- T2* in seconds (0.01-0.1s): Converts to ms with info message
- T2* in ms (10-100ms): Uses as-is with warning about BIDS convention
- Invalid values (≥1000): Raises error

### Updated: `check_te_values()`
- Echo times in seconds (<1): Converts to ms with info message
- Echo times in ms (>1): Uses as-is with deprecation warning
- Updated docstring to reflect BIDS preference

### CLI updates
- `-e` help text now shows seconds as preferred with examples
- `--t2smap` help text specifies seconds with auto-detection note

## Test plan

- [x] Added `test_check_t2s_values()` with comprehensive test cases
- [x] Updated `test_check_te_values()` tests
- [x] All existing tests pass (131 tests)
- [x] Flake8 and black checks pass

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0932906efd3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.