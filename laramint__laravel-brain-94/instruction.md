# Issue

**Title:** Rebuild a changed file the scoped pass never traced

## Description

## What

A scoped run traces **controllers** — `$controllers` is filtered to those declared in the changed files, and everything a controller reaches is traced with it. A changed file that declares no controller therefore contributes nothing to the fresh graph, and the soundness check below it then compares the previous build's owned edges against nothing at all.

Reproduced on the harness #84 added, with a service the route's controller calls:

```php
// before                      // after
public function run()          public function run()
{                              {
    return 1;                      return $this->helper();
}                              }
```

Scope: `app/Services/Publisher.php`. The result:

```
missing from the scoped graph:
  app_services_publisher::run -[action-to-service:calls]-> app_services_publisher::helper
```

No exception, no fallback — a graph missing the call that was just added, and nothing to say so.

## The asymmetry that hid it

The check does its job for a controller, because a scoped pass rebuilds one. For any other file the two sides read:

| the edit | previous build owns | fresh pass owns | outcome |
|---|---|---|---|
| removes a call | that edge | nothing (never traced) | mismatch → **refused**, full rebuild |
| adds a call | nothing | nothing (never traced) | equal → **accepted**, the added edge lost |

So the guarantee held in the direction where the previous build happened to own something, and silently failed in the other. That is also why a test could pass over it: `it('reproduces a full build when the edit left the call graph alone')` scopes to the controller, which is the one file this all works for.

The same hole reached from the other side: a file whose **parse failed** owns none of the edges its body would have made — the class node exists, resolved from the call site, but nothing under it does. Fixing the syntax adds every call the body makes, and that read as "no change" too.

## The fix

The previous build already recorded which controllers reach that file. So the scope is widened with them — `ScopeExpansion::controllerFilesReaching()` walks the previous graph backwards from what the changed files own and collects the controller files above them — and the fresh pass re-derives those files' edges through the chains that reach them.

With something real to compare, each shape lands where it should:

| the edit | before | after |
|---|---|---|
| adds a call inside a non-controller file | accepted, edge lost | **refused** → full rebuild |
| changes a body, no call moved | accepted, node data carried over stale | accepted, **node rebuilt** |
| a file the graph attributes nothing to | accepted | accepted, unchanged |

The middle row is the one worth reading twice: the fast path is not narrowed for it, and it is now *more* correct than before. The changed file's nodes are substituted with their freshly built selves, where the merge previously had none to substitute and reused the previous build's.

## Cost

One backwards walk of the previous graph per scoped run, plus tracing the controllers it names.

The walk is linear and small: **10.4 ms** on a synthetic 12,400-node / 23,600-edge graph, the shape of a large application's, measured over five calls.

The tracing is the real cost, and it is the price of the guarantee: a changed service reached by *N* controllers now traces *N* of them where it traced none. It is still far short of a full pass — that traces every controller in the project — and the alternative is the graph above, which is wrong. A file nothing reaches widens nothing, so the case that motivated keeping such files on the fast path in #84 (45% to 86% of `app/`) is untouched, and its test still passes unchanged.

## What it does not do

A changed file the previous graph attributes **nothing** to widens nothing, because there is no recorded chain to widen along. For that file to matter to the fresh graph something must now reach it, which takes an edit to its caller — and that caller is in the scope, owns provenance, and is traced. The caller's own contract (no file added or deleted) is what closes the rest.

## Tests

Appended to `tests/Unit/ScopedRebuildTest.php`:

- an edit that added a call inside a file declaring no controller → refused
- an edit that changed only a body → fast path kept, and the file's nodes come back rebuilt (asserted on node signatures, not edges: the edges are identical by construction, and the node data is exactly what a merge reusing the old node gets wrong)
- a file the previous build could not parse, coming back → refused

Checked against the unpatched analyzer: all three fail without the source change, and the seven existing scoped tests pass on both sides.

Full suite green (257 passed, 858 assertions), phpstan 0 errors, pint clean.

## Relationship to #92 and #93

Independent of both — different file, different subsystem, no overlapping lines. Any merge order works.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.