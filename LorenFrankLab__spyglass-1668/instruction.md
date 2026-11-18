# Issue

**Title:** Clear the error log before a new populate_all_common attempt

## Description

.

`populate_all_common` decides whether an ingestion failed by querying `InsertError` for the current `dj_user`, `connection_id`, and `nwb_file_name`. Nothing ever removed rows from a prior attempt, so a rerun within the same session inherited the earlier run's failures. It reported tables that had actually succeeded, and with `rollback_on_fail=True` it deleted an ingestion that was clean.

The `err_query = InsertError & error_constants` check near the end of `src/spyglass/common/populate_all_common.py` is scoped to a triple that is stable across repeated attempts in one session, so stale rows match it.

This deletes the `InsertError` rows matching that same triple immediately after `error_constants` is built and before population starts. Scoping to the full triple means only this user's own prior attempts at this specific file are cleared, never another user's and never another file's. `InsertError` has no dependent tables, so `delete_quick` is correct here. A `Notes` section in the docstring records the new behavior.

Tested with a new `tests/common/test_populate_all_common.py` holding two tests. The first seeds a stale `InsertError` row, stubs out `single_transaction_make`, and asserts a clean run returns `None` and leaves no rows. The second confirms the clear does not hide real failures: it makes the stubbed ingestion log an error and asserts those are still returned and that no stale message survives. Restoring the source from `master` makes both fail, and both pass after.

These ran against the real backend, using the repo's docker MySQL fixture and the session-autouse `mini_insert` fixture.

Disclosure: this change was prepared with AI assistance. I have reviewed and tested it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc0c5d3279dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.