# Issue

**Title:** Run a build with the cycle collector off

## Description

## What

A build runs with PHP's cycle collector switched off, and the caller's setting is restored
afterwards.

That collector exists to reclaim objects which reference each other in a loop. A build makes none:
ASTs are trees, and nothing here links a child back to its parent. Measured across three
applications, the collector ran 15 to 37 times per build and collected **zero** objects every
time — including at the deliberate `gc_collect_cycles()` the analyzer already calls after
releasing the tracer's class cache. Every one of those passes walks the root buffer and finds
nothing to free.

## Cost

| application | scan before | scan after | |
|---|---:|---:|---|
| A | 1,954 ms | 1,841 ms | **−6%** |
| B | 1,263 ms | 1,211 ms | −4% |
| C | 1,156 ms | 1,134 ms | −2% |

Re-measured against `main` after #80, #81 and #84 landed — those made a scan substantially faster,
so these are smaller in absolute terms than the numbers this description carried before, and the
share is what moved. Medians of three runs with the arms interleaved in one session, each arm its
own checkout. Every individual rep favours the branch, and parse counts are identical on all
three, since nothing about what gets analysed changes.

Repeated builds in one process — what watch mode does — gain more, because the collector would
otherwise run on every one of them:

| application | five builds before | five builds after | |
|---|---:|---:|---|
| B | 4,436 ms | 3,992 ms | **−10%** |

## What it costs in memory: nothing

This is the question that decides whether the change is worth making, so it was measured rather
than argued:

| application | arm | peak | at the end | collector runs | **collected** |
|---|---|---:|---:|---:|---:|
| B, one build | before | 198 MB | 196 MB | 15 | **0** |
| B, one build | after | 196 MB | 196 MB | 1 | **0** |
| B, five builds | before | 198 MB | 196 MB | 30 | **0** |
| B, five builds | after | 198 MB | 196 MB | 5 | **0** |
| A, one build | before | 250 MB | 250 MB | 19 | **0** |
| A, one build | after | 250 MB | 250 MB | 1 | **0** |
| A, five builds | before | 252 MB | 250 MB | 37 | **0** |
| A, five builds | after | 252 MB | 250 MB | 5 | **0** |

Peak memory does not move, and does not drift across five builds in one process. The runs that
remain on the right-hand side are the explicit `gc_collect_cycles()`, one per build, which still
happens and still collects nothing.

The honest limit of that evidence: it says the collector finds no cycles in *these* applications.
An application whose graph did contain some would hold that garbage for the length of a build
rather than the length of a collection cycle.

## Giving it back

The collector is a global setting on someone else's process, so the change borrows it rather than
takes it. `gc_enabled()` is read first and restored in a `finally`, which matters because a scoped
run raises `ScopedRebuildNotApplicable` from the middle of a build — a restore at the end of the
happy path would leak the disabled state out of a rescan that watch mode then carries on with.

A caller that had already turned the collector off gets it left off.

The body of `analyze()` is unchanged; it moved into a private `runAnalysis()` so the wrapper can
be read at a glance.

## Gate

Full build output — graph, all subgraphs, manifest, totals, the tracer's edge list — is
byte-identical to `main` on three applications.

## Tests

`228 passed (782 assertions)` · PHPStan level 5 + larastan **No errors** · Pint clean.

Three new, all about the borrowing rather than the speed: the collector is given back, it is
given back when the analysis throws, and a caller who had it off keeps it off. Each was checked by
breaking what it guards — dropping the `finally` kills the second, restoring unconditionally kills
the third.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89f243945a65`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.