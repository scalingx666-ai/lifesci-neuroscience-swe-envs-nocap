# Issue

**Title:** Fix premature database connection on import of SpyglassConfig

## Description

Importing `from spyglass.settings import SpyglassConfig` triggered a database connection attempt before any DB was configured, breaking the new-user setup flow.

**Root cause:** `dj_helper_fn.py` contained a module-level `dj.schema("common_export_error_log")` call. Since `settings.py` imports `str_to_bool` from `dj_helper_fn`, loading the settings module caused the schema decorator to fire `dj.conn()` immediately.

```python
# Previously failed with OperationalError against any invalid host
import datajoint as dj
dj.config['database.host'] = 'bad_host'
from spyglass.settings import SpyglassConfig  # now safe
```

## Changes

- `src/spyglass/utils/export_error_log.py` *(new)*: Extracted `ExportErrorLog` table and its `dj.schema()` declaration into a dedicated module, decoupling it from `dj_helper_fn` imports.
- `src/spyglass/utils/dj_helper_fn.py`: Removed module-level schema/table definition; replaced `ExportErrorLog` usage with a lazy import inside `make_file_obj_id_unique()`.
- `src/spyglass/utils/dandi_file_updates.py`: Updated import to point to new `export_error_log` module.
- `tests/utils/test_dj_helper_fn.py`: Added subprocess-based regression test that sets an invalid DB host and asserts the import succeeds without a connection attempt.

# Checklist:

- [x] N/A. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] N/A. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] N/A. If this PR makes changes to position, I ran the relevant tests locally.
- [x] N/A. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1aedccc29c5c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.