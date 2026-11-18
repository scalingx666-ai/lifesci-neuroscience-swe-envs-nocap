# Issue

**Title:** Remove deprecated functionality marked for removal in PyNWB 4.0

## Description

## Motivation

PyNWB 4.0.0 is a major release, so functionality deprecated with a "will be removed in PyNWB 4.0" notice is now removed.  for the tracked list.

### Removed

- `ProcessingModule.add_container`, `get_container`, `add_data_interface`, `get_data_interface` → use `add` / `get`.
- The `extensions` argument of `get_type_map`, `get_manager`, and `NWBHDF5IO` → load cached namespaces from the file or pass a prebuilt `manager`.
- `ScratchData` `notes` argument and `notes` property → use `description`.
- `NWBFile.add_scratch` `notes` and `table_description` arguments → use `description`.
- `NWBFile` `ic_electrodes` argument → use `icephys_electrodes` (the legacy NWB-1.x reader now maps to `icephys_electrodes`).
- `pynwb.validate` `paths` argument → use `path` and call once per file.

### Changed to read-only

- `NWBFile.icephys_filtering` is now read-only. Use `IntracellularElectrode.filtering` for new files. The legacy `/general/intracellular_ephys/filtering` value still reads from older files; setting it on a new file raises.

### Also

- Inlined the private `_validate_single_file` helper into `validate()`, which became its only caller once the `paths` loop was removed.
- Updated the `extensions.py` and `scratch.py` gallery examples that used `add_container`.
- Added a release PR template checklist item to remove deprecated functionality slated for removal on major releases.

## How to test the behavior?
```
ruff check . && codespell
pytest tests/unit/test_base.py tests/unit/test_scratch.py tests/unit/test_icephys.py \
       tests/unit/test_icephys_metadata_tables.py tests/unit/test_extension.py \
       tests/unit/test_file.py tests/validation/test_validate.py \
       tests/back_compat/test_import_structure.py
```

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f9e1c41aa0d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.