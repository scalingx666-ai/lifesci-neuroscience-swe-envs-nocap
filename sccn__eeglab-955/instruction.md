# Issue

**Title:** Fix pop_selectevent empty epoch guard

## Description

## Summary

Restore the missing `isempty(Iepoch)` condition in the epoched event selection guard. `erroronempty='on'` should reject an empty selection, not every selection that deletes epochs.

Add eight deterministic regressions covering selected sample values, epoch and event consistency, empty selections with errors enabled and disabled, inverted epoch selection, event deletion, explicit options, and dataset arrays.

## Verification

MATLAB R2025b on Apple silicon, starting from `sccn/eeglab:develop` at `5c27fc095bc43216ffccdb027f7c40477edf3e2f`.

The regression suite produced 4 passes and 4 failures before the implementation change, then 8 passes and no failures afterward.

All three previously failing EEGLAB test callers pass with the fix: `test_demo_selectevent_glitch`, `test_test_pop_selectevent`, and `test_test_pop_comperp`. The first also exercises overlapping epochs.

Run the new tests from the repository root:

```matlab
results = runtests('tests/test_pop_selectevent.m');
assertSuccess(results);
```

This is problem 2 of the requested local test repair. No plugin changes, statistical algorithm changes, or data files are included.

The new regressions are wired into the existing MATLAB CI job when its license token is available. Octave smoke testing passed. In the current run, the MATLAB execution steps were skipped because the token was unavailable, so the local MATLAB results above are the execution evidence.

Companion PRs:   and

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c27fc095bc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.