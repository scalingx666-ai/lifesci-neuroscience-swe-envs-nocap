# Issue

**Title:** [dataquery] Loading, empty and failed all look the same

## Description

## Description

A query that is running but has not returned a row yet renders "Query not yet run", because the loading bar treats a count of zero as nothing having happened. A query that legitimately returns no rows says the same thing.

A stream that errors, or that closes without its terminating byte, never reaches the end of stream callback. That callback is the only thing that clears the loading flag, so the page waits forever and shows nothing.

A run whose query the user cannot access is reported with `console.error`. The queries endpoint filters those out deliberately, so the condition is expected, and it fills the console on every page load.

## Changes

- The loading bar reports progress from the first render, and stays indeterminate until there is a total to measure against.
- `fetchDataStream` handles a reader that reports done, and reaches the end of stream callback on every exit path.
- A run referencing a query that is not in the accessible list is skipped without logging.

## Testing Instructions

1. Run a query in the Data Query Tool. From the first render it should read "Loading data:" and never "Query not yet run".
2. Open the browser console on the main page. There should be no "Could not get" entries.

## Related Issues

Covers half of #9829, the misleading state. The error message and the re-run button are in #11195.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc0f3a1373c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.