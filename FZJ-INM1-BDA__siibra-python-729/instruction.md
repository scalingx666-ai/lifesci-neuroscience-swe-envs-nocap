# Issue

**Title:** BIDS helper

## Description

## Add lightweight BIDS filename parsing and sidecar metadata

This adds `siibra/retrieval/bids.py`, a small, dependency-free module for working with BIDS-structured repositories, plus a factory function that builds on it.

### What's new

- `parse_bids_filename(filename, strict=False) -> BIDSFileInfo` parses a filename into a flat `entities` dict, plus `suffix`, `extension` and `datatype`. Parsing is generic key-value splitting rather than schema-based, so non-core entities such as TemplateFlow's `tpl-` and `atlas-` work as well. Entity values stay strings (`run-01` → `"01"`), and multi-part extensions like `.nii.gz` are kept whole. Entity keys and suffixes must be alphanumeric, and values must follow the BIDS label format (alphanumeric plus `+`). With `strict=True`, any name that breaks the filename rules raises a `ValueError`. Otherwise, the name is parsed as far as possible and every deviation is logged at debug level.
- `find_bids_sidecars(filename, repository) -> List[str]` returns the JSON sidecars that apply to a file under the BIDS inheritance principle. They're ordered from the dataset root down to the file's folder. The lookup walks up from the file's folder and stops at `dataset_description.json` or the repository root. A sidecar applies if it has the same suffix and its entities are a subset of the file's.
- `load_bids_metadata(filename, repository) -> dict` merges those sidecars top-down, so a key at a lower level overrides the same key from a higher level.
- `extract_bids_info(repository, suffix, extension=None, folder="")` in `factory.py` returns `{path: BIDSFileInfo}`, sorted by path, for every file with the given BIDS suffix. JSON sidecars are excluded unless `extension=".json"` is requested.
- Unit tests in `test/retrieval/test_bids.py` cover parsing in both modes, sidecar ordering, merging, and the stop at the dataset root.

### Design notes

- **No new dependencies:** pybids was considered but is too heavy for this purpose, and its default config drops non-core entities.
- **Merging:** sidecars are merged per top-level key; a nested object at a lower level replaces the one above rather than being combined with it. Only JSON sidecars are resolved, not other inheritable files such as `.tsv` or `.bvec`.
- **Differences from BIDS:** these are listed in the module docstring.
  - Entity keys aren't checked against the BIDS schema, and index values (`run`, `echo`, ...) aren't checked to be integers.
  - In non-strict mode, entities with values outside the label format (e.g. `desc-julich-brain`) are kept. Unreadable parts, empty keys or values, and repeated entities are skipped.
  - The datatype is only taken from a parent folder named like a BIDS datatype.
- **Suffix required for sidecars:** sidecar lookup raises `ValueError` for a file without a suffix, since BIDS matches sidecars by suffix.
- **Several sidecars in one folder:** BIDS allows at most one applicable sidecar per folder. If there are several, a warning is logged and the one with the most entities is used.
- **Repository-agnostic:** all I/O goes through `RepositoryConnector.search_files` and `RepositoryConnector.get`, so the code works with any connector. URL handling is left to the caller and connectors.

### Things to check in review

- `extract_bids_info` and `find_bids_sidecars` assume that `search_files` returns paths relative to the repository root, for every connector.
- If a repository contains `derivatives/` or `sourcedata/`, a search from the root includes those files. Use `folder` to scope the search.
- Strict parsing rejects top-level files named in full, such as `dataset_description.json`, because `dataset` reads as a malformed part. Sidecar lookup isn't affected, since it parses non-strictly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac1a7b874975`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.