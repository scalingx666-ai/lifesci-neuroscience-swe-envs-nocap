# Issue

**Title:** Speed up voxelytics workflow queries

## Description

### Summary
Speeds up the slow voxelytics workflow DB queries in `VoxelyticsDAO`. Opening the largest workflow used ~30 s of DB time. It now uses ~2 s.

- `findTaskRuns`, `findCombinedTaskRuns`, `getChunkStatistics`: the chunk state is computed once in a `MATERIALIZED` CTE, filtered by run ids (and task name). The CTE carries all needed columns, so `voxelytics_chunks` is no longer re-joined by primary key. Postgres misestimates the derived `state` column (27 estimated vs. 745k actual rows) and picked nested loops. The "latest including / excluding skipped-pending" pair of `DISTINCT ON`s is now a single pass ordered by `state NOT IN (SKIPPED, PENDING) DESC, beginTime DESC NULLS LAST`.
- `getArtifactChecksums`: deduplicates only the requested artifacts' events (`LATERAL` + `DISTINCT ON` via the `(_artifact, path, timestamp)` PK) instead of the whole table. Also fixes the empty `WHERE` (an SQL syntax error) when `artifactName` is omitted.
- `findRunsForWorkflowListing`: the task/artifact aggregates are restricted to the visible runs instead of all tasks in the system.

No schema changes. Method signatures and results are unchanged.

**Measurements**: local Postgres 17 on a production dump, warm cache, `EXPLAIN (ANALYZE, BUFFERS)` of the exact SQL the Scala code generates (median of 3):

| Query | Case | Before | After |
|---|---|---|---|
| `findTaskRuns` | 6 runs, 745k chunks | 26.6 s | 0.55 s |
| `findTaskRuns` | 22 runs, 217k chunks | 11.6 s | 0.11 s |
| `findCombinedTaskRuns` | 745k chunks | 4.3 s | 1.7 s |
| `findCombinedTaskRuns` | 217k chunks | 1.1 s | 0.42 s |
| `getChunkStatistics` | 745k chunks, one task | 9.7 s | 1.4 s |
| `getChunkStatistics` | 217k chunks, one task | 1.24 s | 0.29 s |
| `getArtifactChecksums` | 61k checksum events | 0.49 s | 0.08 s |
| `getArtifactChecksums` | no `artifactName` | SQL error | 0.08 s |
| `findRunsForWorkflowListing` | org with 6.3k runs | 0.24 s | 0.23 s |
| `findRunsForWorkflowListing` | org with 341 runs | 0.23 s | 0.02 s |

A small workflow (3 runs, ~600 chunks) stays at 2–30 ms. The earlier audit baseline (transcribed SQL) was 23.7 s / 5.2 s / 6.8 s / 0.67 s for the first four query types.

**Equivalence**: a local throwaway test ran the old and new DAO against the dump and compared the parsed results (row count and set equality). It covered the workflows above, a small workflow, admin / non-admin / small-org users for the listing, and `artifactName = None` (equal to the union of the per-artifact results). All matched. One edge case changed: the old latest-chunk-state query merged begin/end times from different chunk rows via `COALESCE` when the selected non-skipped row had a NULL time. The new query reports the selected row's own times. This case does not occur anywhere in the dump (checked across all 2.5M chunk keys).

I also tried scoping `findWorkflowTaskCounts` but left it unchanged: its results depend on arbitrary `DISTINCT ON` tie-breaking (tasks with NULL `beginTime`), so equality couldn't be verified.

### Steps to test:
- Open the voxelytics workflow list and a workflow detail page (task list, chunk statistics, artifact checksums). The data should look the same as before.
- `GET /api/voxelytics/workflows/:hash/artifactChecksums?runId=…&taskName=…` without `artifactName` now returns the checksums of all the task's artifacts instead of an error.

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f949c9285167`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.