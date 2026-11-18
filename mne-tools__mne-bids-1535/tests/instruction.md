# Issue

**Title:** Add HED write support to events.json sidecar

## Description

## Summary

- Extract HED tags from `HEDAnnotations` and write as sidecar mapping in `events.json` (`"trial_type": {"HED": {...}}`)
- Falls back to HED column in `events.tsv` when same trial_type has different HED strings
- Set `HEDVersion` in `dataset_description.json`
- Fix `make_dataset_description()` overwrite logic to allow adding new fields without overwriting existing ones
- Fix `_events_json` docstring

**Depends on #1534**

## Test plan

- [x] `test_write_hed_annotations` — write + roundtrip: verifies sidecar HED in events.json, HEDVersion in dataset_description.json, no HED column in events.tsv, HEDAnnotations reconstructed on read

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `272142beb31c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.