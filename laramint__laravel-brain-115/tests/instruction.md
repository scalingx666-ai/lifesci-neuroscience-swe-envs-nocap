# Issue

**Title:** Feat: show how much data each model's table actually holds

## Description

A model node said what the class declares and nothing about what it sits on. The first question anyone asks before touching a query — is this table a hundred rows or fifty million — was the one question the graph could not answer.

Model nodes now carry the row count, the heap size, the index size and the total, in a `Table Data` section on the Info panel:

<img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/115-table-stats/table-data-panel.png" width="380" align="right">

```
TABLE DATA
rows       ~55,540
table          11 MB
indexes        18 MB
total          29 MB
```

That is `IntegrationLog` on the application this was built against, and it is a fair example of why the numbers belong side by side: **the indexes are larger than the table**. Nothing in the class says so, and nothing in the graph could have.

The section sits under the node's existing metrics and above its properties, so it reads in the order someone actually asks: what is this, how heavy is it, then where does it live.

## Why reading a live database is the right call here

The objection writes itself — a static analyzer that opens a connection. Two things answer it.

**The data is usually there anyway.** Development and staging environments are routinely restored from anonymised production dumps, precisely so that what people test against resembles what they ship to. A scan run there reports the sizes the application really has. And nothing stops pointing the scan at a production replica through `table_stats.connection`, which is where the numbers are not merely representative but exact.

**There is a way out.** `laravel-brain.table_stats.enabled` turns the step off entirely — no connection is opened, no query is issued, and the rest of the scan is unchanged. Anyone who wants the analyzer to stay purely static keeps it that way with one line, and CI, which typically has no database worth measuring, loses nothing by leaving it on: the step fails quietly and the scan finishes.

## Portable first, detailed second

`Schema::getTables()` already returns a total size on every driver Laravel supports — `pg_total_relation_size` on Postgres, `data_length + index_length` on MySQL and MariaDB, `dbstat` on SQLite, its own sum on SQL Server. This PR writes none of that SQL; the framework maintains it, across versions, for all five. **245 tables in 0.14s, one call.**

The row count and the heap/index split are not exposed anywhere in the framework, so those are one query per driver:

| driver | rows | heap/index split |
|---|---|---|
| PostgreSQL | `pg_class.reltuples` | `pg_table_size` / `pg_indexes_size` |
| MySQL / MariaDB | `information_schema.TABLES.TABLE_ROWS` | `data_length` / `index_length` |
| SQL Server | `sys.dm_db_partition_stats` (exact) | by `index_id` |
| SQLite | — | — |

SQLite degrades to the total, and a driver nobody anticipated degrades the same way. Every figure on `TableStats` is nullable because a partial answer is a real answer, and the UI prints `—` rather than `0` for a figure nobody measured — those are different claims.

## Estimated rows, deliberately

An exact `count(*)` is a sequential scan, and across a few hundred models a scan would spend minutes in it. The planner's own estimate is free and answers the question actually being asked. It renders as `~55,540` rather than implying a fact, and Postgres's `-1` for a table that has never been analysed is reported as unknown rather than as zero rows.

## Matching a model to its table needed the model

This is the part I got wrong first, and only a run against a real codebase showed it.

Parsing finds a table name only when the model writes `protected $table` in its own file. Everything else is invisible to a parser and all of it is ordinary: a connection prefix, a `$table` inherited from a base class, or a base model that overrides `getTable()`. On the application measured here the base class prefixes every table with `fm_`, so parsing guessed `orders` for a table called `fm_orders`:

```
parsed table names       2 of 183 models matched
asked the model        151 of 183 models matched
```

`ModelTableResolver` constructs the model and calls `getTable()` — the one thing that cannot be wrong, because it is what Eloquent itself calls. It is guarded per model, so a constructor that needs arguments or a trait booting against an unbound service costs only that model its numbers. It runs only when the step is enabled, which keeps "may this scan consult the running application" a single switch.

## Nothing here may break a scan

No connection, credentials without access to the catalog, a schema holding none of the application's tables, an unknown driver — every one ends as missing numbers and a finished scan. Verified both ways:

```
LARAVEL_BRAIN_TABLE_STATS=false   0 tables measured, no payload on any node
default                         245 tables measured, 151 model nodes carrying it
```

## One bug the tests caught first

Listing tables by whether they reported a size dropped SQLite's tables entirely — SQLite compiled without `dbstat` answers `size => null` for a table that plainly exists, and the filter turned a missing measurement into a missing table. Fixed, and pinned by a test that fails when the filter comes back.

## Verified

Four unit tests drive a real in-memory SQLite through Capsule rather than a mock that would agree with whatever the code does. Checked in a browser against a real 623-route application: the section renders on route tabs as well as the ERD tab, on the Info panel where the model's other properties already live.

`409 passed (1128 assertions)`, PHPStan clean, Pint clean, `tsc -b` and `eslint` clean. One entry chunk ships; the superseded one is deleted.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2bf14bbb41d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.