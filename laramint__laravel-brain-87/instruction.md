# Issue

**Title:** Add cross-project "Usages" tab for graph nodes

## Description

## Problem

The Sidebar's "Edges" tab only ever shows incoming/outgoing edges from the
currently-loaded route tab's subgraph, because `GraphSplitter` splits the full
project graph into forward-only, per-route JSON files and the frontend loads
one tab at a time. A shared `Service` or `Model` used by five different routes
only shows the one incoming edge from whichever route happens to be open — the
other four callers are invisible. There's no way to answer "where else is this
used, and how many files depend on it" without manually clicking through every
route tab.

## Change

Adds a "Usages" tab: click any node, see everywhere it's referenced across the
*whole* project, grouped by file, not just the loaded tab.

`UsageFinder::find()` (`src/Ai/UsageFinder.php`) reuses `MergedGraph::load()` —
the same de-duplicated full-graph reconstruction `ContextExporter`/`RulesExporter`
already rely on — and does a single O(E) pass over the merged edge list to
collect direct (one-hop) incoming references, grouped by the referencing node's
file. It lives in `src/Ai/`, not `src/Graph/`, since it works on the merged
graph's plain arrays like its siblings, not `Node`/`Edge` objects — nothing in
`src/Graph/*` depends on `Ai/`/`Storage/` today, and this keeps it that way.

New `GET /api/usages?nodeId=...` mirrors `context()`'s shape (404 with the same
"no scan data" message, 422 on a missing `nodeId`, 404 for an unknown node id).
Frontend adds `useNodeUsages`/`UsagesView`, mirroring `useFileSource`/`SourceView`'s
lazy-fetch-on-open pattern, and an ungated "Usages" tab next to Edges — reusing
existing `edge-row`/`ins-chip`/`sidebar-section` styles, no new CSS.

### Two things that would have been silently wrong

1. **Duplicate edges.** `GraphBuilder::addEdge()` gives identical repeated
   edges (a method calling the same dependency twice) a distinct
   per-occurrence id on purpose. Counting raw incoming edges overcounts —
   usages are grouped by *source node id* first, so the group count is the
   real number of distinct callers.
2. **`resolveFile()` returns `''`, not `null`,** when a file can't be
   resolved. Usages without a resolvable file each get their own group keyed
   by node id, instead of collapsing into one misleading shared "file."

## What this is not

One hop, incoming-only — who directly references this node, not a transitive
impact/blast-radius graph. Also no click-to-navigate from a usage row to the
node it names: the merged graph discards which tab(s) a node lives in, so
"jump to it" needs new tab-membership tracking, which is a real follow-up, not
part of this change. Both are intentionally left for the next feature (warning
before a change/delete) that this is groundwork for.

## Tests

`./vendor/bin/pest` — 257 passed (853 assertions), 8 new in
`tests/Unit/UsageFinderTest.php`: cross-tab merge via a real `FileGraphStore`
fixture, duplicate-edge dedup, self-loop exclusion, unknown node id, a node
with zero usages, and fileless usages staying in separate groups. PHPStan
(level 5 + larastan) and Pint both clean. `tsc -b`, `vite build`, and `eslint`
clean on the frontend.

Also ran the real `ProjectAnalyzer` against the `tests/fixtures/laravel-project`
fixture (not just synthetic test data) and called `UsageFinder::find()` on the
resulting scan output directly — e.g. `middleware::auth` correctly resolves to
6 usages, all grouped under `routes/api.php`; `OrderController` resolves to 5
distinct routes, also grouped under `routes/api.php`. No HTTP-level test layer
exists in this repo (not even `context()`/`scan()` are tested that way), so the
controller wiring was verified by matching `context()`'s pattern exactly rather
than adding a new testing style for one endpoint.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40f99afe5404`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.