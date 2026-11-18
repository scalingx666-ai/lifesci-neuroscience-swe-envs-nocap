# Issue

**Title:** Fix: breadth-first layout never terminates on a graph with a cycle

## Description

## `layoutBreadthFirst` never terminates on a cycle reachable from a root

Selecting **Breadth-first** as the layout algorithm hangs the browser tab, and with it the UI, on a large share of graphs. The graph does not have to be big: the one I first hit it on has 20 nodes and 25 edges.

The function is not breadth-first. It relaxes toward the **longest** path:

```ts
if (!level.has(v) || level.get(v)! < nextLv) {
  level.set(v, nextLv)
  q.push(v)
}
```

Every trip around a cycle finds a longer path, so the condition holds again, the node is re-queued, and the level grows without bound. There is no visited set, no cycle detection and no depth cap, so the loop cannot end — and it runs on the main thread.

### A cycle is the normal case, not an exotic one

> **Precision, from review:** it takes a cycle **reachable from a root**, not any cycle. A bare inverse pair with nothing pointing into it gives both nodes an in-degree of 1, so `roots` is empty, the queue never runs, and the old code returns immediately — with the two cards overlapping, which is #100's defect rather than this one. Everything real has a controller pointing into the models, so the two cases coincide in practice; the distinction matters only if the sentence above is read as a spec.

An inverse pair of Eloquent relations is a two-node cycle: `hasMany` on one model, the matching `belongsTo` on the other. The tab that led me here contains four of them, all ordinary:

```
AmazonCredentials --[hasMany]--> AmazonCredentialsChannel --[belongsTo]--> AmazonCredentials
AmazonCredentials --[hasMany]--> AmazonReport             --[belongsTo]--> AmazonCredentials
AmazonCredentials --[hasMany]--> AmazonNotificationSubscription --[belongsTo]--> …
AmazonNotificationDestination --[hasMany]--> AmazonNotificationSubscriptionTenant --[belongsTo]--> …
```

Running the exact loop over that tab's stored graph: **2,000,000 iterations, queue still non-empty, level counter at 285,718.**

Across one application's 623 stored tabs, **136 never terminate** — including `erd--models`, the full model ERD at 183 nodes, which is among the first things a person opens.

### The fix

Level each node once, on the first path that reaches it. That is what breadth-first means, it matches the "similar to Cytoscape breadthfirst" the docblock claims, and it terminates by construction:

```ts
let head = 0
while (head < q.length) {
  const u = q[head++]
  const lv = level.get(u)!
  for (const v of adj.get(u) ?? []) {
    if (!level.has(v)) {
      level.set(v, lv + 1)
      q.push(v)
    }
  }
}
```

All 623 tabs now complete, the worst in 130 iterations.

**This is a visible change, not only a fix.** A node whose deepest path was longer now sits at its shallowest depth instead, so some layered graphs will lay out slightly differently. That is the difference between breadth-first and longest-path layering, and the shipped name and docblock both say the former.

The `q.shift()` also became an index walk, since shifting an array is O(n) and there is no reason to pay it.

### Also in the same function

`nodes.find((n) => n.id === id)` inside the per-layer loop is O(n²) — 33k scans on the 183-node ERD. Not the hang, and I would not normally touch it in a bug fix, but it is inside the loop being repaired, so it is now a lookup map.

### Tests

There is no JS test runner in `frontend/` — no vitest, no jest — so there is nowhere to put a regression test for this, and adding a test framework is not something to smuggle into a bug fix. Happy to open that separately if you want it; a termination test for this function is exactly the kind that earns its place.

What I can offer instead is a reproduction that needs no framework. Against any stored graph JSON, the old loop does not terminate and the new one does:

```
tabs examined       623
old loop, hangs     136      (cap: 200,000 iterations)
new loop, hangs       0      (worst case: 130 iterations)
```

### Verification

- `npm run lint` clean, `tsc -b` clean.
- Bundle rebuilt: only the app chunk changed hash (`index-DSQtxLY2.js`); the css and vendor chunks hash identically to what is already committed, so the diff is one source file, one new chunk and the blade reference.
- Confirmed in the emitted bundle that the guard is now `l.has(n) || (l.set(n, t + 1), u.push(n))` and the old `l.get(n) < e` comparison is gone.
- PHP side untouched: `254 passed`, PHPStan 0, Pint clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.