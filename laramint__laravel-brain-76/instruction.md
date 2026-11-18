# Issue

**Title:** Rescan only what changed in watch mode

## Description

## What

Watch mode ran a full scan on every save. It now traces only the controllers declared in the
changed files and merges the result into the graph the previous run produced.

| application | full rescan (today) | scoped rescan | |
|---|---:|---:|---|
| B — 1,885 files | 769 ms | 244 ms | **2.9×** |
| C — 4,152 files | 938 ms | 574 ms | **1.6×** |

Measured in a warm process, because that is what watch is. Measuring it as a fresh CLI run
flatters it by counting parse work watch never repeats — that framing showed 1.7× and 1.1×, and
it is the wrong one.

It is not more than this, and the ceiling is worth stating plainly: the win is bounded by how
much of a scan is controller tracing, which is **21% on B and 7% on C**. Facade scanning is 24%
and 60%. Anything beyond these numbers has to come from there, not from here.

## The result is the same graph

A rescan that is fast and subtly different is worse than no rescan. The scoped result is
byte-identical to a full scan of the same tree on both applications — every node, every edge,
their payloads and their order, and all 358 and 406 tabs.

## When it refuses

Reusing the previous graph's edges is only sound while the changed files' own call graph is
intact. An edit that adds or removes a call invalidates it, and that is not knowable until the
scoped build has run and can be compared.

So it is compared, and a mismatch raises `ScopedRebuildNotApplicable` — an exception rather than
a returned flag, so a partial graph cannot be mistaken for a whole one by a caller that forgot to
check. Watch catches it and rescans in full.

It also rescans in full when a file appears or disappears, or when anything outside `app/`
changes: both can move the route table or reachability wholesale, and neither is worth reasoning
about incrementally.

## One change to full scans

The ERD tab is now ordered by model name. It was laid out in the order tracing happened to reach
each model, so it reshuffled whenever an unrelated controller changed which model it touched
first — the diagram churned for reasons that had nothing to do with the models.

Against three applications that is the **only** difference a full scan shows: node order, edge
set and every other tab are unchanged. It is also what makes the scoped path produce an identical
ERD, since a scoped run traces fewer controllers and would otherwise reach the models in a
different order every time.

## What is in here

`BuildFingerprint` hashes the tree by content and reports what changed. `GraphProvenance`
partitions a graph by the source file each node came from. `IncrementalMerge` computes the dirty
set and reconstructs a whole graph from a previous one plus a scoped rebuild.
`IncrementalAnalyzer` orchestrates those, and `ProjectAnalyzer::scopedTo()` is the seam the scan
command drives.

Two bugs found by measuring against real applications rather than fixtures, both fixed here:

- `applyPartial` added untouched nodes in one pass and rebuilt ones in a second, which moved every
  rebuilt node to the end. The merged graph held the right nodes in the wrong sequence.
  `IncrementalMerge::signature()` normalises order, so the existing tests could not see it.
- The ERD ordering above.

## Tests

`198 passed (710 assertions)` · PHPStan level 5 + larastan **No errors** · Pint clean.

Fourteen new across the four units, including a merge test that asserts the node *sequence*
rather than the normalised signature, and a splitter test pinning that the ERD is laid out in the
order it is given — which is why the caller sorts.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3687ae425513`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.