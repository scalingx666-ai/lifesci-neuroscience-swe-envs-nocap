# Issue

**Title:** [dataquery] Replaying a large query run times out

## Description

## Description

Replaying a stored query run filters the rows down to the candidates the user can access. It does that with a linear `in_array` over the accessible list once per row, building a `CandID` object each time, so the work grows with the square of the row count.

On a run of 32,487 rows it does not finish. The request hits the 30 second execution limit inside that loop and returns 366,274 of 425,752 bytes, so the user gets 86% of their results and no error:

```
PHP Fatal error:  Maximum execution time of 30 seconds exceeded in
modules/dataquery/php/endpoints/queries/query/run/run.class.inc on line 119
```

Building the lookup once takes the same request to 2.8 seconds and returns all of it.

## Changes

- `_jsondecoded` builds a set of the accessible CandIDs once and tests membership with `isset`.

## Testing Instructions

1. Run a query in the Data Query Tool that returns tens of thousands of rows.
2. Reload it from Recent Queries. The error log should show a max execution time fatal, and the table should be missing rows.
3. Apply the change.
4. Reload it again. It should return every row in a few seconds.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc0f3a1373c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.