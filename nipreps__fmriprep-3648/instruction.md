# Issue

**Title:** Fix SBRef sorting when EchoTime is missing

## Description

Closes nipreps/fmriprep#3646.

## Summary
- Handle SBRef files that are missing `EchoTime` metadata when sorting matches.
- Keep SBRefs with `EchoTime` sorted by echo time and fall back to filename for missing values.
- Add a regression test covering multiple SBRefs with missing `EchoTime` metadata.

## Test plan
- `python3 -B -m pytest fmriprep/workflows/bold/tests/test_fit.py::test_get_sbrefs_handles_missing_echo_time`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69ca63c3f636`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.