# Issue

**Title:** Fix: layered layouts overlap because spacing ignores node size

## Description

## Before and after

Same tab, same scan, same viewport, fit to view — only the commit differs (`7201e8e` against `6f1d59f`). Driven with Playwright rather than posed by hand.

| before | after |
|---|---|
| <img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/100-layer-spacing/before.png" width="430"> | <img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/100-layer-spacing/after.png" width="430"> |

Cards sit on top of each other in both directions on the left: `…IsResour…`, `…entials` and `AmazonCre…` are labels a neighbouring card is covering. The rows are pitched at a constant that is narrower than the cards they carry, so the wider a card is, the further it reaches into the one beside it.

## Layered layouts space nodes by a constant pitch that ignores how big they are

> Builds on #99, which is the other defect in the same function. This branch is stacked on it so the diff stays to the spacing; merge that one first.

`layoutBreadthFirst` positions cards with `spacingX`/`spacingY = 88`, used as the distance between card **centres**:

```ts
node.x = i * spacingX - ((idsInLayer.length - 1) * spacingX) / 2
node.y = l * spacingY
```

A card is 185–270 wide (`buildLayoutNode` clamps `CARD_W_MIN`…`CARD_W_MAX`) and 90 tall (`CARD_H`). An 88px centre pitch therefore guarantees an overlap of **97–182px horizontally** and **2px vertically** — every card in a layer sitting on top of its neighbour, with the labels unreadable.

### It is not a consequence of #99

Worth stating plainly, because the two defects live in the same function. The positioning block is untouched by the levelling fix — `git diff` over that PR shows no `spacingX`, `spacingY`, `node.x` or `node.y` line.

And it is measurable on graphs the old code could always lay out. Of one application's 623 stored tabs, 444 are acyclic, so the old levelling loop terminated on them and they rendered: **all 444 came out with overlapping cards.** The overlap was invisible on the cyclic ones only because those never finished laying out at all.

### The fix

Measure the gaps against what they have to clear. Within a layer each card contributes its own width (or its own height, when the layout runs left-to-right), and layers are separated by the tallest card in the one before:

```ts
const rowWidth = layerNodes.reduce((sum, n) => sum + n.width, 0) + gapWithinLayer * (layerNodes.length - 1)
const rowHeight = Math.max(...layerNodes.map((n) => n.height))
let x = -rowWidth / 2
for (const node of layerNodes) {
  node.x = x + node.width / 2
  node.y = cursor + rowHeight / 2
  x += node.width + gapWithinLayer
}
cursor += rowHeight + gapBetweenLayers
```

The parameters change meaning — from centre pitch to the gap between card edges — so they are renamed to say so, and default to 60/110 to match the `nodesep`/`ranksep` already handed to dagre. The two layouts read alike now instead of one of them being unusable.

Re-measured over the same tabs after the change: **0 with overlapping cards.**

### `layoutGrid` has the same defect, milder

A fixed `cellW = 200` against cards up to 270 wide overlaps by 70px. Same root cause — a constant chosen without reference to the thing it has to fit — so the cell is derived from the widest card in the graph. Its call site passed `200, 130` as cell sizes; it passes nothing now and takes the gap defaults.

I would normally leave a second function out of a bug fix, but this is the identical mistake ten lines away, and fixing one while leaving the other reads as an oversight rather than a decision.

`layoutDagre` was already correct: it hands real `width`/`height` to dagre and lets it separate them. `layoutCircle` and `layoutForce` position by radius and by simulated collision, and neither uses a fixed pitch.

### Verification

- Measured geometrically, using the same `buildLayoutNode` width formula the renderer uses: 444/444 tabs overlapping before, 0/580 after.
- Confirmed in a browser against a real application: cards separated, edge labels (`hasMany`, `belongsTo`) legible between them where they were previously covered.
- `npm run lint` clean, `tsc -b` clean, bundle rebuilt (only the app chunk changed hash).
- PHP side untouched: `254 passed`, PHPStan 0, Pint clean.

No test — the same reason as #99: `frontend/` has no JS test runner, and adding one belongs in its own change rather than in a bug fix. The geometric check above is reproducible against any stored graph JSON.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.