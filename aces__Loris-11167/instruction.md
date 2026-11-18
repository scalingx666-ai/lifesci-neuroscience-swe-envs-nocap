# Issue

**Title:** [dataquery] Fetch accessible instruments in a single query in the dictionary module

## Description

## Description

`/dictionary/categories` (and `/dictionary/module/<name>`) scaled linearly with the number of distinct visit labels in the database. `getUserModuleCategories()` built the set of instruments the user can access by running one `Utility::getVisitInstruments()` query per visit label, and each of those queries joins `session`, `candidate`, `flag` and `test_names`.

This replaces the per-visit loop with a single query that fetches the distinct instrument names across all of the user's visits. The query returns names only, since the result is only used to check whether an instrument is in the list.

## Changes

- Replaced the per-visit `foreach` loop in `LORIS\dictionary\Module::getUserModuleCategories()` with a single query over all of the user's visits
- The query returns `Test_name` only, so `Full_name` is no longer fetched

## Testing Instructions

1. Use a database with a large number of distinct `session.Visit_label` values.
2. Log in and open the Data Query Tool, or request `GET /dictionary/categories` directly.
3. Confirm the endpoint now returns quickly rather than blocking for tens of seconds.
4. Confirm the instrument categories shown in the tool are the same as before this change (the response body should be identical).

## Related Issues

. The slow loop was introduced in #9903.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1b4aae45f13`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.