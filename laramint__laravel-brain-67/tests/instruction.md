# Issue

**Title:** Extract each tab's subgraph from an index, not a full-graph rescan

## Description

## What

`GraphSplitter::extractSubgraphForward()` walked every node and every edge of the full graph
once per tab, keeping whatever was reachable from that tab's seeds. Both the tab count and the
graph grow with the application, so the split step costs O(tabs x (nodes + edges)).

`split()` now builds two indexes once — node id to its position, and edges grouped by source —
and each tab touches only its own reachable set. The stored positions restore the original
insertion order, so the subgraph that comes out is unchanged.

| | split step |
|---|---:|
| generated 3,160-file corpus (5,901 nodes, 15,337 edges, 1,553 tabs) | 683 ms → **29 ms** |
| real 1,885-file application (358 tabs) | 54 ms → **6 ms** |

Peak memory is unchanged at 502 MB on the large corpus: the indexes hold ids and positions
against nodes and edges the graph already owns.

## Why this is small today

Fifty milliseconds. On the applications I have to hand this is not a speedup anyone will
notice, and I would rather say so than dress it up.

What makes it worth fixing is the shape of the curve rather than its height. Measuring the same
generated corpus at four sizes:

| scale | nodes + edges | split step | vs previous |
|---|---:|---:|---:|
| 1x | 2,702 | 11.5 ms | |
| 2x | 5,350 | 43.6 ms | 3.8x |
| 4x | 10,646 | 162.5 ms | 3.7x |
| 8x | 21,238 | 682.5 ms | 4.2x |

Every doubling of the codebase roughly quadruples this step: a log-log fit puts the exponent at
1.97, against ~1.0 to 1.1 for every other step in the analyze phase. Eight times the graph costs
59 times as much here. That is the kind of thing you meet in a monorepo, long after the decision
that led to it.

Worth being precise about where it ranks. Against `main` today it is the fourth-largest step at
8x scale, behind graph (5.9 s), facades (4.7 s) and lifecycle (0.7 s). With #66 applied it
becomes the largest — 614 ms of a 2.5 s analyze — because that PR removes the repeated work the
other steps were doing and this one is left standing. Either PR is fine to merge first; they
touch different files.

The other reason to fix it now is that tab extraction stops being a once-per-build cost as soon
as builds become incremental, since re-splitting affected tabs after a change would run it
repeatedly.

## Behaviour

Unchanged, and checked rather than asserted. Building both arms and serialising everything a
consumer sees — the full graph, all 358 subgraphs, the tab manifest, the totals, and the
entry-point tracer's complete edge list — gives byte-identical output on a real application
(13,866,026 bytes, identical on `main` and on this branch). Each arm was dumped twice first, to
confirm that a build is deterministic and that the comparison can detect anything at all.

Ordering is the part most at risk here. Reachability is discovered breadth-first, which is not
the order nodes were added in, so the old code got insertion order for free by rescanning the
graph while the new code has to restore it deliberately. There is now a test pinning it, and it
passes on `main` too — that is the point, since it locks an invariant rather than blessing a
change.

## Tests

`151 passed (511 assertions)` · PHPStan level 5 + larastan **No errors** · Pint clean.

The 3 deprecation notices are pre-existing vendor tooling on PHP 8.5 (`pest-plugin-arch` calling
`ReflectionProperty::setAccessible()`), unrelated to this change.

## Note

Independent of #66. That PR never touches `GraphSplitter` and this one touches nothing else, so
the two can be reviewed in either order without conflicting.

---

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1672c75e4a83`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.