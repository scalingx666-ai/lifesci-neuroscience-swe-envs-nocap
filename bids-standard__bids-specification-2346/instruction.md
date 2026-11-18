# Issue

**Title:** [FIX] Add emg to timeseries rule for physio/stim files

## Description

## Summary
- Add `emg` to the base `timeseries` rule datatypes in `src/schema/rules/files/raw/task.yaml`
- This allows `_physio`, `_physioevents`, and `_stim` suffixes to be valid within `emg/` directories
- EMG was the only datatype missing from the timeseries rule, despite being a first-class BIDS datatype since v1.11.0 (BEP 042)

## Context
When converting the [HySER dataset](https://physionet.org/content/hd-semg/1.0.0/) to BIDS-EMG format, finger force sensor recordings (`_physio.tsv.gz`) placed alongside EMG data cause `ALL_FILENAME_RULES_HAVE_ISSUES` validation errors because the validator schema does not include `emg` in the timeseries rule.

All other electrophysiology datatypes (`eeg`, `ieeg`, `nirs`) as well as `beh`, `func`, `meg`, `motion`, `pet`, `anat`, `dwi`, and `perf` already support physio/stim files.

## Test plan
- [x] Verify `emg` is a defined datatype in `src/schema/objects/datatypes.yaml`
- [x] Run schema tests
- [x] Validate a BIDS-EMG dataset with `_physio.tsv.gz` files passes after this change

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b766732218cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.