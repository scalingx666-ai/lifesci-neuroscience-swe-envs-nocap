# Issue

**Title:** Asr testing

## Description

This PR...

- adds returning early from cleaning data with ASR if no calibration data is available
- moves setting the lifecycle state in the asr processor to the different branches in set_state_from_calibration_data instead of after calling clean_calib_data (to avoid the state being reported as "STABLE" before the asr_calibrate step fails)
- catches a LinAlgError in case the asr_calibrate step fails

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c7871ca670d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.