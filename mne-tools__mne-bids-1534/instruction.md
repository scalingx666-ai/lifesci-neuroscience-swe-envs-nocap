# Issue

**Title:** Add HED read support from events.json sidecar

## Description

## Summary

- Read HED tags from JSON sidecar annotations (`"trial_type": {"HED": {"show_face": "Sensory-event"}}`) and/or direct HED column in `events.tsv`
- Create `HEDAnnotations` (from MNE-Python) when available, with graceful fallback for older MNE versions
- Add `_assemble_hed_from_sidecar()` to resolve categorical and template HED specs per row
- Add `_read_hed_version()` to read `HEDVersion` from `dataset_description.json`
- Add `_safe_iadd_annotations()` to handle merging `HEDAnnotations` with regular `Annotations`
- Update tiny_bids fixture with HED sidecar data and HEDVersion

## Test plan

- [x] `test_events_file_to_annotation_kwargs` — HED column separated from extras
- [x] `test_handle_events_reading_hed` — column HED, default version fallback, n/a fallback
- [x] `test_assemble_hed_from_sidecar` — categorical + template HED assembly
- [x] `test_handle_events_reading_sidecar_hed` — sidecar HED → HEDAnnotations

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `031db3c3114e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.