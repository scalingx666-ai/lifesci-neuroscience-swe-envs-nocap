# Issue

**Title:** Bulk retry and delete for local-only files in Vault Health

## Description

Vault Health's "Notes in other formats missing from the Remote Vault" list only offered Show per row. Stuck files usually come in batches, so it now gets bulk actions.

- Checkbox per row, Select all / Clear selection.
- **Retry all / Retry selected (n)**: runs the attachment pass now and forgets this session's refusals for those paths (`AttachmentSync.retryFiles`). Hidden when the plan blocks these file types.
- **Delete selected (n)**: the sidebar's delete behind a confirm that says these files are the only copy (never on the Remote Vault) and deletion is permanent; partial failures stay in the dialog with reasons.

Tests: `localOnlyFileActions.test.ts` (4) + a `retryFiles` case in `treeBinaries.test.ts`; desktop suite 2328 passed, tsc clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b0d59143157`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.