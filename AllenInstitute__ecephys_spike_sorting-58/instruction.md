# Issue

**Title:** Updates for Kilosort3 compatibility

## Description

* Squeeze `channel_map.npy` array on load ()
* Include KS3 parameters in `create_input_json.py`
* Load cluster quality from `KSLabel` column if `group` column fails
* Add option to ignore PC-based metrics when `pc_features.npy` is not available (see  for more details)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3aa6b9782ecc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.