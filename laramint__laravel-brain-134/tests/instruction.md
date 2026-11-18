# Issue

**Title:** Keep the first facade-scan read for the second pass

## Description

## What

The facade scan's second pass exists so a child that never names `Facade` is still found when it extends an app-level base that does. After reading a file in round one it discarded the bytes and opened every remaining file again the moment a chain name turned up.

Completeness does not need that second open. The first pass already has the source.

## Cost

Medians of four interleaved runs in one session, warm, against this branch's merge-base. Lifecycle runs before facades and is the canary. Parse counts do not move.

| application | php files in app/ | facades | facade phase | scan |
|---|---:|---:|---:|---:|
| A | 1,121 | 0 | 59 → 66 ms | 1,996 → 2,027 ms |
| B | 1,951 | 6 | 208 → 152 ms | 1,433 → 1,371 ms |
| C | 4,309 | 0 | 445 → 441 ms | 1,540 → 1,528 ms |

B is the application that has facades, so it is the one that actually runs the second pass. That is where the 56 ms comes from. A and C have none; their facade phase remains a single read of every PHP file under `app/`.

During the phase the unread sources occupy about 6 MB / 6 MB / 16 MB. Peak RSS of the whole scan is unchanged on A and B, and +2 MB on C; the graph phase still dominates it.

## Why this shape

#80 left this phase reading every file once to apply the filter. Parallel reads did not help. A filename filter on `*Facade.php` misses application facades that are not named that way.

The `Facades\` skip is unchanged. It no longer copies each file to do it; compared with `str_replace('Facades\\', '', $code)` it admits the same 3 / 15 / 8 files on 1,121 / 1,951 / 4,309 files under `app/`.

## Gate

Full build output — graph, all subgraphs, manifest, totals, the tracer's edge list — is **byte-identical on all three applications**, 40.2 MB, 16.4 MB and 20.4 MB of dump apiece. Parse counts 733 / 1,098 / 746 on both arms.

## Tests

`397 passed (1107 assertions)` · PHPStan level 5 + larastan **No errors** · Pint clean.

No new tests. Removing the second pass fails `it discovers a facade whose own file never mentions Facade`. Re-reading the pending files from disk leaves the suite green, so the speed claim is the wall-clock table, not an assertion.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2bf14bbb41d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.