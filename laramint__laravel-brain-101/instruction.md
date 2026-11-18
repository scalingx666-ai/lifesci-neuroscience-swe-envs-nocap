# Issue

**Title:** Fix: a component with no entry point is flattened onto level 0

## Description

## Before

<img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/101-unreached-components/before.png" width="760">

Four Apilo models, all reached only by each other: `ApiloCredentials ⇄ ApiloMigrationRun ⇄ ApiloMigrationStep`, `ApiloMigrationRun ⇄ ApiloRecord`. Every one has an in-degree of at least one, so the component has no root, the queue never reaches it, and the four come out in a flat row with the hub wedged between its own children.

Their positions, read off the laid-out nodes on each side:

```
before (6f1d59f)   (-6518, -139)  (-6273, -139)  (-6028, -139)  (-5783, -139)
after  (b7148f7)   (-5779, -195)  (-2754,    5)  (-2920,  205)  (-2675,  205)
```

One y before, three after — that is the whole fix, and it is more legible as four numbers than as a picture.

**There is no matching "after" screenshot, deliberately.** Once the component is levelled it is placed within the graph's own layers rather than in a row of its own, and those four nodes end up 3,104px apart across a 183-node ERD. Framing them makes a 6% zoom where nothing is readable, so a paired image would show less than the coordinates above. Whether that placement is the right one is a fair question, but it is a layout question rather than evidence this one is unfixed.

This is also the only tab of 621 in the application I measured that has a rootless component at all, which is why the defect survived: it is invisible unless a model cluster happens to have no controller pointing into it.

## A component with no entry point loses its structure

> Builds on #100, which is in the same function. Stacked so the diff stays to this change; merge that one first.

`layoutBreadthFirst` levels outward from nodes with an in-degree of 0, then sweeps up whatever the walk missed:

```ts
for (const n of nodes) if (!level.has(n.id)) level.set(n.id, 0)
```

Not every component has such an entry. Two models joined only by an inverse relation — `hasMany` one way, `belongsTo` back — form a component with nothing pointing in from outside it, so there is no node to start walking from. Every member lands on level 0 no matter what it connects to, in one undifferentiated row next to the genuine roots.

**Measured on a real graph, not a constructed one.** In one application's model ERD, **53 of 183 nodes** are never reached and get flattened. Across the same application's 580 stored graphs it is the only one affected, which is what you would expect: a route graph always has the route itself as an entry, and only the ERD is pure model-to-model.

### The fix

After the walk from the natural roots, keep seeding from the least depended-on node that still has no level, until every node has one:

```ts
for (;;) {
  let seed: LayoutNode | null = null
  for (const n of nodes) {
    if (level.has(n.id)) continue
    if (seed === null || indeg.get(n.id)! < indeg.get(seed.id)!) seed = n
  }
  if (seed === null) break
  level.set(seed.id, 0)
  q.push(seed.id)
  drain()
}
```

In-degree is a heuristic for "most root-like", which is all it has to be — inside a cycle there is no correct answer, only a more useful starting point than "all of them at once".

On that ERD the widest layer goes from **110 nodes to 75**: the 53 stop being a flat row and take their component's own depth.

That figure is application-specific and should not be read as typical. It scales with how many entry-less components a model graph happens to have, and that varies a lot — measured on three other applications the counts were 7 and 4 flattened nodes, with the widest layer going 86 → 82 on one and not moving at all (67 → 67) on another. The direction is consistent; the size of the win is not.

It also covers the degenerate whole-graph case, where no node has an in-degree of 0 at all. The queue then started empty, the loop ran zero times and the sweep put every node on level 0. No stored graph I have is in that shape, but it reproduces on eight models wired in a ring of inverse relations, where the layering goes from one flat row of eight to the eight-deep chain it actually is.

### What this does not do

It does not make a 183-node ERD readable. Seventy-five cards on one level is a very wide row whatever the spacing, and the layout that would handle that graph better is dagre — which is exactly what `pickLayoutKind` substitutes away above 80 nodes. This change stops the layout discarding structure it already has; it does not add structure that is not there.

### Verification

- Layer assignment measured against the stored graphs, using the same levelling the renderer runs: 53 flattened nodes before, 0 after; widest layer 110 → 75.
- Rendered in a browser against the real ERD: no console errors, graph draws.
- `npm run lint` clean, `tsc -b` clean, bundle rebuilt (only the app chunk changed hash).
- PHP side untouched: `254 passed`, PHPStan 0, Pint clean.

No test, for the reason given in #99 and #100: `frontend/` has no JS test runner, and adding one belongs in its own change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.