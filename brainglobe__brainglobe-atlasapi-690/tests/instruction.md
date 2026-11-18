# Issue

**Title:** feat: Add type annotations to core API components

## Description

## What Does This PR Do?

This PR adds **standard Python type annotations** across core modules to improve code clarity, IDE support, and static analysis — without modifying any runtime logic.

---

## Files Updated

- `brainglobe_atlasapi/core.py`
- `brainglobe_atlasapi/utils.py`
- `brainglobe_atlasapi/structure_tree_util.py`
- `brainglobe_atlasapi/bg_atlas.py`
- `brainglobe_atlasapi/list_atlases.py`

---

## Summary of Changes

### General Improvements
- Added **type hints** to all public-facing functions
- Corrected **misleading or outdated docstrings**
- **No runtime logic changed** (non-breaking)

---

## Why Is This Needed?

Although the project ships with `mypy` in dev dependencies, several core files were previously untyped. Adding type annotations:

- Improves **developer experience**
- Enables **better static analysis**
- Provides **stronger IDE autocompletion**
- Reduces **onboarding friction** for new contributors

---

## Detailed Changes

### `brainglobe_atlasapi/bg_atlas.py`

#### Type Hints Added
- Return type annotations for:
  - `_version_tuple_from_str`
  - `_version_str_from_tuple`
- Fully typed the `BrainGlobeAtlas` class:
  - `__init__` constructor arguments
  - Properties:
    - `local_version`
    - `remote_version`
    - `local_full_name`
    - `remote_url`
  - Methods:
    - `download_extract_file`
    - `__repr__`
    - `__str__`

#### Type-safety Improvements
- Added `assert full_name is not None` in `local_version` to satisfy type checkers before string manipulation
- Refactored `remote_version` to use an intermediate variable for typed dictionary access

---

### `brainglobe_atlasapi/list_atlases.py`

#### Type Hints Added
| Function | New Signature |
|----------|---------------|
| `get_downloaded_atlases` | `() -> List[str]` |
| `get_local_atlas_version` | `(atlas_name: str) -> Optional[str]` |
| `get_all_atlases_lastversions` | `() -> Dict[str, Any]` |
| `get_atlases_lastversions` | `() -> Dict[str, Dict[str, Any]]` |
| `show_atlases` | `(...) -> None` |
| `add_atlas_to_row` | `(...) -> Table` |

- Imported required types (`List`, `Dict`, `Any`, `Optional`) from `typing`

---

## Related Issue

Closes **#689**

---

## Testing

- `mypy` executed locally  
  - External stub-related warnings exist but are unrelated to this PR
- No change in runtime behavior

---

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `225b817d459a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.