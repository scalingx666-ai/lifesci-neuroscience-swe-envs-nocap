# Issue

**Title:** FIX: warn instead of raise on missing coordsystem.json for iEEG

## Description

## Summary

I added the stricter requirement in #1508, but after spending more time with real iEEG datasets I think it was the wrong call. Electrode locations can also reach the `Raw` through the recording's own montage / `channels.tsv` / `space-*` sidecars, so refusing to read at all when only `coordsystem.json` is missing was too aggressive.

This aligns iEEG with the existing EEG/MEG behavior: warn and return the raw without applying a montage.

## Test plan

- [x] `test_handle_ieeg_coords_reading` (both parameterizations) — assertion flipped from `pytest.raises` to `pytest.warns`
- [x] `test_read_eeg_missing_coordsystem_warns`, `test_read_eeg_root_electrodes_no_coordsystem`, `test_read_meg_missing_coordsystem_warns` — unchanged, still pass

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29a04fb4719a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.