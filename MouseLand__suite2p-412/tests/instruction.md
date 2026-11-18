# Issue

**Title:** Added testing page to suite2p wiki and nwb test.

## Description

PR addresses #410 and #372. 

- Adds page that explains how to set up dvc and run tests.
- Fixes merge conflict in installation.rst that was left alone.
- Added `read_nwb` and `save_nwb` calls to `1plane1chan` pipeline test. Test now checks that nwb export works and suite2p outputs can be retrieved from exported nwb.
- Added functions to test utils that retrieve lists of output data and test_data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7b3eab028ea0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.