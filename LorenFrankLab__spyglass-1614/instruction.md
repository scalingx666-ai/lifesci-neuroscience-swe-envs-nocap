# Issue

**Title:** Migrate ElectrodeGroup and Electrode to SpyglassIngestion mixin

## Description

# Description

Migrates `ElectrodeGroup` and `Electrode` in `common_ephys.py` to the `SpyglassIngestion` mixin for object-oriented data ingestion, following the patterns established in #1377 and #1423.

- `src/spyglass/common/common_ephys.py`:
    - **`ElectrodeGroup`**: Inherits `SpyglassIngestion` instead of `SpyglassMixin`. Implements `_source_nwb_object_type` (`pynwb.ecephys.ElectrodeGroup`), `table_key_to_obj_attr`, and overrides `generate_entries_from_nwb_object` for BrainRegion lookup, probe type extraction, and hemisphere determination. `make()` now delegates to `insert_from_nwbfile()`.
    - **`Electrode`**: Inherits `SpyglassIngestion` instead of `SpyglassMixin`. Overrides `get_nwb_objects` to return the electrodes DynamicTable directly, `generate_entries_from_nwb_object` for full electrode processing (region caching, novela probe detection), and `insert_from_nwbfile` for config YAML override application. `make()` now delegates to `insert_from_nwbfile()`. `create_from_config` preserved unchanged.

Both tables are now automatically handled by `populate_all_common`'s `isinstance(table(), SpyglassIngestion)` check, calling `insert_from_nwbfile` instead of the legacy `make` path.

# Checklist:

- [X] N/A. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/A. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/A. If this PR makes changes to position, I ran the relevant tests locally.
- [X] N/A. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f2bab8da7a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.