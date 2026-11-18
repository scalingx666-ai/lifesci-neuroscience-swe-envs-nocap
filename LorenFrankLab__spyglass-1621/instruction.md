# Issue

**Title:** Fix mixin changes breaking ingestion mapping doc generator

## Description

# Description

The ingestion mapping doc generator (`docs/src/api/ingestion_mapping_generate.py`) crashes due to `SpyglassMixin.__init__` now validating table state on instantiation. The `_subclass_factory` helper was unnecessarily instantiating classes to get their module name, triggering this validation on undeclared tables.

- `src/spyglass/utils/dj_helper_fn.py`: Replace `new_class().__class__.__module__` with `new_class.__module__` — no need to instantiate a class just to read its module attribute
- `docs/src/api/ingestion_mapping_generate.py`: Add `onerror` handler to `pkgutil.walk_packages()` so package-level import failures (e.g., missing DB config) are skipped rather than terminating the crawl

# Checklist:

- [X] N/A. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/A. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/A. If this PR makes changes to position, I ran the relevant tests locally.
- [X] N/A. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `395aa1a80afa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.