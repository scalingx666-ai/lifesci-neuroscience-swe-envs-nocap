# Issue

**Title:** Optimize job list and worker polling DB queries

## Description

### Summary
Job queries account for ~29 % of production DB time (pg_stat_statements, 65 days, 49.6 h total). This PR makes them cheap:

- **Jobs list** (`GET /api/jobs`, polled by the dashboard and the jobs list): the access check looked up each job owner's organization in a correlated subquery and forced a seq scan over all jobs. It is now phrased as "owner is the requesting user or a user of an org they are admin of", so the planner can drive the query from that small user set via a new `jobs(_owner)` index. Access semantics stay the same. `listAccessQ` is only used by `findAllCompact`.
- **Worker polling** (`requestJobs`): new index `jobs(_worker, manualState, state)` turns all predicates of the per-worker unfinished/cancelling lookups and the unassigned-pending counts (`_worker IS NULL`) into index conditions. It replaces the plain `jobs(_worker)` index. Production uses generic plans here (buffers per call match the generic plan locally), so I checked both custom and generic plans.
- The high/low-priority `COUNT` pairs per poll iteration are merged into one query each (`COUNT(*) FILTER (...)`), which halves those round trips.
- I also tried an index on `commandargs->>'dataset_id'` for the `skipForDeletedDatasets` variant. It brought no measurable gain, so it is not included.

#### Measurements
Local dump (PG 17, ~19.5 k jobs) with the production settings (`work_mem=2GB, random_page_cost=1, effective_cache_size=32GB, max_parallel_workers_per_gather=4`). `EXPLAIN (ANALYZE, BUFFERS)`, old/new runs interleaved, 3 runs each, every run in its own session. Indexes were created in a transaction that was rolled back.

| Query | Prod (calls × mean) | Local old (ms, buffers) | Local new (ms, buffers) |
|---|---|---|---|
| Jobs list, unfiltered, org admin (largest org) | 213 k × 50 ms (all users) | 25–39, 63 k | 2.3–2.7, 4.1 k |
| Jobs list, unfiltered, non-admin (largest org) | | 7.6–8.5, 4.1 k | 1.6–1.8, 2.8 k |
| Jobs list, unfiltered, admin of small org | | 23, 60 k | 0.12, 22 |
| Jobs list, unfiltered, admin of org with most users | | 23, 60 k | 0.65–0.68, 1.2 k |
| Dashboard (`convert_to_wkw` + skipForDeleted), org admin | 103 k × 88 ms | 19–21, 29 k | 2.1–2.3, 3.0 k |
| Dashboard, non-admin | | 11, 3.4 k | 1.7, 2.3 k |
| Dashboard, admin of small org | | 18–19, 28 k | 0.11, 16 |
| Worker: cancelling jobs (generic plan) | 2.29 M × 3.6 ms, ~1.1 k buffers | 2.2–2.4, 1.1 k | 0.16–0.18, 180 |
| Worker: unfinished jobs list (generic plan) | 1.20 M × 3.4 ms | 2.2–2.4, 1.1 k | 0.03–0.04, 4 |
| Worker: unfinished count (generic plan) | 6.99 M × 1.1 ms, ~311 buffers | 2.3–2.6, 1.1 k | 0.03–0.04, 4 |
| Worker: unassigned pending count (generic plan) | 2 × 3.50 M × 0.6 ms, ~218 buffers | 0.16–0.21, 81 | 0.03, 2 |
| Worker: reserveNextJob select | | 0.19–0.24, 84 | 0.02–0.03, 2 |

#### Equivalence
- Jobs list: compared old vs. new SQL with `EXCEPT` both ways plus row counts for 411 users: random admins and non-admins, job owners, deleted users, and the benchmark users. I checked all four combinations of the command filter and `skipForDeletedDatasets` (1,644 checks, 34 k rows). Zero differences.
- Merged counts: compared old vs. new results for all workers and datastores, with the state/manualState predicates relaxed so the counts are non-zero. All equal.

#### Follow-up (not in this PR)
The jobs list still has no pagination; the dashboard and the jobs list fetch the full list every 60 s. Server-side pagination would need a frontend redesign.

### Steps to test:
- Apply evolution 188, then open the dashboard and the jobs list as org admin and as non-admin. You should see the same jobs as before.
- Run a worker. Jobs should still be picked up, respecting the high/low-priority limits, and cancelling should still work.

### Issues:
- none

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Added migration guide entry if applicable (edit the same file as for the changelog)
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12ece4df61a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.