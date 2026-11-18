# Issue

**Title:** Store original transaction IDs in history tables

## Description

For documentation purposes and potential discussion I don't merge this change directly into `dev`. This branch updates history tracking to store the correct transaction ID in CATMAID's history tables. This ID is needed to correctly relate transaction log entries to rows in either the live tables or its history table. In current `dev`, however, history tables store the ID of the transaction that created the history entry and _not_ the ID of the original transaction that created or updated the live table that made the history row valid (and part of the live table) before. With this branch the original transaction ID is stored for each history entry.

To implement this, some major changes had to be made. Although Postgres stores the creating/updating transaction ID for each row already in a `xid`  [system column](https://www.postgresql.org/docs/9.5/static/ddl-system-columns.html), we can't rely on it to stay valid for the lifetime of the row. At some point [transaction ID wraparound](https://www.postgresql.org/docs/9.5/static/routine-vacuuming.html#VACUUM-FOR-WRAPAROUND) kicks in and old `xid` get overridden with a frozen transaction ID and the original information is lost. The original information would be needed once the live table entry is moved to history though.

Therefore, CATMAID has to track the original transaction IDs itself in order to make the transaction log useful. Similar to time tracking, live tables can either provide their own transaction ID column or it is tracked in a separate table. It is currently only allowed to either provide both time and txid columns or none. If none are provided, a tracking table keeps track of both, which is created and managed by the history tracking system.

As the benchmark below shows, using separate tracking tables for _all_ versioned tables is a huge performance hit (think of all the joins and index updates needed during each update). Therefore nearly all CATMAID tables now have a new column: `txid`. It stores the original transaction ID of each row as `bigint`, because this is what [txid_current()](https://www.postgresql.org/docs/9.5/static/functions-info.html#FUNCTIONS-TXID-SNAPSHOT) returns. We use this function opposed to the momentary valid `xmin` because opposed to `xmin` it is unique and won't expire (besides the 4 byte current transaction ID, it also includes a 4 byte epoch counter). This should also imply that we don't need to always look at a transaction ID and a timestamp together, we now should be able to just use this 8 byte txid. This improves robustness, because some tables allow modification of their edition time and now we don't need to rely on this timestamp anymore for lookup.

Since the last CATMAID release is only a few days old and existing history tracking isn't in production use yet (as far as we know), this branch implements these changes by completely removing the present history tracking system and re-creating the new version from scratch. (while also making some variable namings more clear, etc.).

Here are some benchmarks of these changes:

![catmaid-txid-tracking-all-commits](https://cloud.githubusercontent.com/assets/112226/17594894/d3fe9042-5fb8-11e6-8d09-3b1be1f5e32f.png)

And in more detail: no history, current history and new version:

![catmaid-txid-tracking-detail](https://cloud.githubusercontent.com/assets/112226/17594906/e3637e58-5fb8-11e6-9b25-2a3074093c54.png)

As can be seen, this is also quite a performance gain for history tracking as a whole. This is somewhat surprising, but I suppose the removing the cast from `xid` to `text` to `bigint` had quite an impact.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2eebba27ee9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.