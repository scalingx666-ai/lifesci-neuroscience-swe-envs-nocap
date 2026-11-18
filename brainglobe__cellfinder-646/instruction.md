# Issue

**Title:** Use single underscore for internal CurationWidget methods

## Description

## Description

Renames five internal helpers in `cellfinder/napari/curation.py` from `__name` to `_name`. A leading `__` triggers name mangling, which exists to avoid clashes with subclasses rather than to mark a method as internal; the convention for internal is a single underscore, as used everywhere else in the repo and by existing helpers in this same file.

| Current | Renamed to |
| --- | --- |
| `__prep_directories_for_save` | `_prep_directories_for_save` |
| `__delete_existing_saved_training_data` | `_delete_existing_saved_training_data` |
| `__extract_cubes` | `_extract_cubes` |
| `__finish_save` | `_finish_save` |
| `__save_yaml_file` | `_save_yaml_file` |

Raised by @alessandrofelder in review of #621.

## What this does not change

Genuine Python protocol methods (`__init__`, `__call__`, `__len__`, etc.) elsewhere in the codebase are untouched.

## References

All call sites are internal to `CurationWidget`, so there is no public API change and no behaviour change. Pure rename: 11 lines, all in `cellfinder/napari/curation.py`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e14fcaa752e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.