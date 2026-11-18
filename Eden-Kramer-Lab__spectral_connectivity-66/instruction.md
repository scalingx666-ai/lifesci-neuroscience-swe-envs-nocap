# Issue

**Title:** chore(wrapper): actionable errors for unsupported measures

## Description

## Summary
- Replace generic error messages with actionable guidance for unsupported xarray wrapper methods
- Provide specific examples showing how to use the Connectivity class directly
- Improve user experience when encountering xarray wrapper limitations

## Changes
- **Error message improvement:** Show concrete code example instead of generic message
- **Method filtering:** Add unsupported methods to `bad_methods` list for auto-exclusion
- **Test compatibility:** Handle both `NotImplementedError` and `ValueError` exceptions
- **New test suite:** Verify error message format and content

## User Experience
**Before:** `NotImplementedError: directed_coherence is not supported by xarray interface`
**After:**
```
ValueError: The method 'directed_coherence' is not supported by the xarray interface.
Please use the Connectivity class directly instead:

from spectral_connectivity import Connectivity
conn = Connectivity.from_multitaper(m)
result = conn.directed_coherence()
```

## Test plan
- [x] Error messages contain actionable code examples
- [x] Unsupported methods excluded from auto-generated method lists
- [x] All wrapper tests pass with improved error handling
- [x] All existing tests maintain same status

🤖 Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `802fa1e72d70`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.