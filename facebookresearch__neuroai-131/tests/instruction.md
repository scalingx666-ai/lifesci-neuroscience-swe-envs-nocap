# Issue

**Title:** Combine fMRI/MEG into hebart2023things

## Description

## Summary

- Combines `hebart2023thingsmeg.py` and `hebart2023thingsbold.py` into
  `hebart2023things.py` with a shared private base class `_Hebart2023Things`
- Extracts duplicated logic into the base: `download_things_images` call,
  `../THINGS-images` path resolution, and `shared_filepath` column construction
- All public class names (`Hebart2023ThingsMeg`, `Hebart2023ThingsBold`),
  `_info` metadata, and study logic are unchanged

## Test plan

- [x] `Hebart2023ThingsMeg` and `Hebart2023ThingsBold` still discoverable via
  `ns.Study.catalog()`
- [x] Existing neuralbench task YAMLs and `debug_study.yaml` references remain valid
  (no class renames)
- [x] Run study unit tests: `pytest neuralfetch-repo/ -k "hebart"`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8778d6c1ea42`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.