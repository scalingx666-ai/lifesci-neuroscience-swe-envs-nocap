# Issue

**Title:** Clean up .h5 test artifact from test_warn_for_nwb_extension

## Description

## Summary
- An earlier commit accidentally included a test file artifact that was not properly cleaned up.
- `test_warn_for_nwb_extension` in `TestNWBHDF5IO` creates a `.h5` file but `tearDown` only cleaned up the `.nwb` file, leaving `test_pynwb_io_nwbhdf5.h5` behind
- Add `.h5` cleanup to `tearDown`, remove the accidentally committed file, and add `*.h5` to `.gitignore`

## Test plan
- [x] Verify `test_warn_for_nwb_extension` still passes
- [x] Verify no `.h5` file is left behind after test run

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0393e967e59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.