# Issue

**Title:** feat(api): validate expectation_type with clear error

## Description

## Summary
- Add early validation of `expectation_type` parameter in `Connectivity.__init__`
- Provide clear error messages listing all allowed values when invalid input is given
- Improve user experience with actionable feedback

## Changes
- **connectivity.py:** Add validation against `EXPECTATION` dict keys with helpful error message
- **New test suite:** 3 tests covering valid types, invalid input, and case sensitivity

## User Experience Improvement
Before: Cryptic KeyError deep in call stack
After: Clear ValueError at instantiation with allowed options

```python
# Example error message:
ValueError: Invalid expectation_type 'invalid_option'.
Allowed values are: 'tapers', 'time', 'time_tapers', 'time_trials', 'time_trials_tapers', 'trials', 'trials_tapers'
```

## Test plan
- [x] All valid expectation types work correctly
- [x] Invalid types raise ValueError with helpful message
- [x] Case sensitivity enforced
- [x] All existing tests maintain same status

🤖 Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `802fa1e72d70`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.