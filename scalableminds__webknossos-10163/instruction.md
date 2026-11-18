# Issue

**Title:** Fix empty display of zero and boolean metadata values

## Description

### Summary

Number metadata entries with value `0` and boolean metadata entries (e.g., imported from NML) were rendered as empty fields in the metadata table of segments and trees.

- Number entries with value `0` are now shown as `0`.
- Boolean entries are shown as a checkbox, which is editable unless the view is read-only.
- The conversion from metadata entries to API metadata entries is extracted into `toAPIMetadataEntry`, with unit tests in `metadata_table.spec.ts`.


### Steps to test:
- Import an NML file containing segment or tree metadata with a number value of `0` and a boolean value (e.g., `false` and `true`).
- Open the metadata table for the segment or tree.
- Verify the number entry shows `0` and the boolean entry shows as a checkbox with the correct state.
- Toggle the checkbox and verify the change is persisted; verify it is disabled in read-only mode.
- Run `yarn test` and confirm `metadata_table.spec.ts` passes.




------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2c10fec879c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.