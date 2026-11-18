# Issue

**Title:** Await the state-vector cache write and reset the cache between tests

## Description

## Why

CI was intermittently red on `persistence.test.ts:345` — `expected true to be false` in *"caches a doc's state vector so an unchanged doc costs one query and no merge"*. Commit `c35d12c` **passed on `staging` and failed on `main` at the same SHA**, which is the signature of a race rather than a regression.

`loadDocDiff`'s slow path ended in `void rememberStateVector(...)`, so it **returned before the INSERT committed**. The test does a cold read and then immediately a warm one, asserting the warm read never touched the snapshot — true only if the write won the race. Measured locally, it usually did not:

| | cache row absent when the cold call returns | suite failures |
| --- | --- | --- |
| before | **35 / 40** | **3 / 8 runs** |
| after | 0 / 40 | **0 / 8 runs** |

Full server suite on a scratch DB: **53 files, 612 tests, all passing**. `tsc --noEmit` clean.

## Production was never wrong — and this is not urgent

The watermark guard already makes a late or out-of-order write safe: `currentStateVector` trusts a cached vector only while `upto_update_id` still equals the log's `max(id)`, and the writer stamps the vector together with the exact log position it was computed from. A racing `appendUpdate` therefore makes the cache **correctly distrusted**, never trusted-and-stale. The failure mode that would matter — telling a client it is up to date while unseen ops sit in the log — cannot arise from this. No hotfix; this rides the next promotion.

What the `void` *did* cost is real, though, and is the reason to prefer `await` on its own merits: the write escaped the pool's backpressure, so a large vault's first connect fired a burst of unobserved INSERTs competing with `runPool`'s backfill reads for the same connections. And the cache was not readable when the call returned, so the next read of the same doc could miss it and redo the whole merge. The cost of awaiting lands only on the slow path, which has already paid a snapshot BYTEA, the full update log and a `Y.mergeUpdates` over it — one INSERT is noise beside that.

## Also: `doc_state_vectors` was never truncated between tests

It was missing from `resetDb`'s table list, while the table it describes (`doc_updates`) is truncated **with `RESTART IDENTITY`**. So a row left by an earlier test could carry a watermark that accidentally matched the next test's rewound log, and `loadDocDiff` would trust a vector belonging to a different document.

This was **not** the cause of the flake — adding the truncate changed the failure rate not at all (2/6 vs 3/8) — but a cache the code trusts has to be reset alongside the log it describes.

## Scope

Server only: one `await`, one test-helper table entry, plus comments recording why. No migration, no desktop code, no API or wire change, so no version bump. `docs/RELEASE_NOTES.md` unchanged — nothing here is visible in the app.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a9f2518038e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.