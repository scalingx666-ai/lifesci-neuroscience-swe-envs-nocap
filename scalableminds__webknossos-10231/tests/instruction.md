# Issue

**Title:** Index dataset layer coordinate transformations and additional axes

## Description

### Summary
`dataset_layer_coordinateTransformations` and `dataset_layer_additionalAxes` had no primary key and no index, but are queried by `WHERE _dataset = $1 AND layerName = $2` once per layer on every data source load (`DatasetLayerDAO.parseAndFillLayerRow`). In production these two queries are 16.6 % of total DB execution time. This PR adds an index on `(_dataset, layerName)` to both tables (evolution 187).

Why plain indexes and not primary keys:
- `coordinateTransformations`: `insertionOrderIndex` is nullable, and the prod dump has a row with `NULL` there, so `(_dataset, layerName, insertionOrderIndex)` can't be a PK without a data migration.
- `additionalAxes`: the dump has no duplicate `(_dataset, layerName, name)`. But axis names come straight from the datasource JSON and aren't checked for uniqueness on write, so a PK could make dataset reporting fail. A plain index gives the same read speedup without that risk.

I left the N+1 in `DatasetLayerDAO.findAllForDataset` (4 child queries per layer) out of scope. With the index each lookup costs about 0.01 ms, so what remains is round-trip latency. Batching those queries can be a follow-up.

#### Measurements
Production, pg_stat_statements (65 days, PG 18.1):

| query | calls | total time | share of DB time | mean | seq scans on table |
|---|---|---|---|---|---|
| coordinate transformations by layer | 53.1 M | 19,345 s | 10.8 % | 0.36 ms | 134 M |
| additional axes by layer | 53.1 M | 10,230 s | 5.7 % | 0.19 ms (max 9.3 s) | 134 M |

Local prod dump (PG 17, warm cache, prod planner settings, `EXPLAIN (ANALYZE, BUFFERS)` on the exact app queries, index created in a transaction that was rolled back afterwards):

| case | before | after |
|---|---|---|
| coord. transforms, layer with a transform | Seq Scan, 75 buffers, 0.121 ms | Index Scan, 3 buffers, 0.017 ms |
| coord. transforms, layer without (common case) | Seq Scan, 75 buffers, 0.073 ms | Index Scan, 2 buffers, 0.006 ms |
| additional axes, layer with an axis | Seq Scan, 10 buffers, 0.043 ms | Index Scan, 3 buffers, 0.014 ms |
| additional axes, layer without (common case) | Seq Scan, 10 buffers, 0.039 ms | Index Scan, 2 buffers, 0.003 ms |
| both lookups for every layer of a 330-layer dataset (server-side loop) | 34.0 ms | 1.5 ms |
| both lookups for every layer of a 70-layer dataset with axes | 7.2 ms | 0.36 ms |

### Steps to test:
- `tools/postgres/dbtool.js check-evolutions-schema` passes
- Apply the evolution and then the reversion on a DB at schema version 186: the schema ends up identical to before
- Open a dataset with coordinate transformations or additional axes: it loads as before

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Added migration guide entry if applicable (edit the same file as for the changelog)
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90c30a97b430`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.