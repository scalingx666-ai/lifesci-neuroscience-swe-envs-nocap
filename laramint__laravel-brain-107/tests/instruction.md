# Issue

**Title:** Fix: circle layout shrinks the space per card as cards are added

## Description

## Before and after

The same 20-node tab in the Circle layout, fit to view, at `b7148f7` and `77a637a`. Playwright-driven, so the pair is one run rather than two sittings.

| before | after |
|---|---|
| <img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/107-circle-radius/before.png" width="430"> | <img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/107-circle-radius/after.png" width="430"> |

The before is the `min(280, 90 + n * 4)` radius: twenty cards 185–270px wide placed 53px apart, so the ring is a stack and most of the labels are behind another card.

## The circle layout shrinks the space per card as cards are added

> Builds on #101, and through it #99 and #100. Stacked so the diff stays to the circle; merge those first.

`layoutCircle` places nodes at uniform angles, so each one gets `2πr / n` of arc. The caller picks the radius like this:

```ts
const r = Math.min(280, 90 + nodesCopy.length * 4)
layoutCircle(nodesCopy, r)
```

A ceiling of 280. So the arc available to each card **shrinks as cards are added** — which is backwards, and past about 48 nodes the ceiling binds and every further node makes it strictly worse.

Twenty cards at radius 170 get **53px of arc each**, for cards 185–270px wide. The ring is a pile in the middle of the canvas with the labels unreadable.

### Sizing it from the cards

Every card gets the same arc, so the arc is sized for the largest — and by its **longer side**, since which side faces the tangent depends on where on the ring a card sits:

```ts
const arc = Math.max(...nodes.map((node) => Math.max(node.width, node.height))) + gap
const radius = Math.max(arc, (n * arc) / (2 * Math.PI))
```

The `Math.max(arc, …)` floor keeps a two-node graph from collapsing onto a radius of nearly zero.

Twenty cards go from a radius of 170 to 987, and from 53px of arc each to 310px.

Measured across 576 stored graphs, laying each out both ways with the renderer's own width formula:

| | tabs with overlapping cards |
|---|---:|
| before | **536** |
| after | **0** |

Confirmed in a browser against a real application: the ring is a ring, and the labels are legible.

### The same defect as #100, one function over

#100 fixed the layered layouts and the grid, where a constant pitch was chosen without reference to card size. This is the same mistake expressed as a constant radius. I did not catch it there because I was checking pitch-versus-width and the circle has no pitch — the relationship is `2πr / n`, and the ceiling made it worse with scale rather than merely wrong at one scale.

`layoutDagre` and `layoutForce` remain correct: dagre is given real dimensions, and the force simulation separates by a collision radius derived from them.

### Verification

- Geometric measurement over 576 graphs, before and after.
- Rendered in a browser, no console errors.
- `npm run lint` clean, `tsc -b` clean, bundle rebuilt (only the app chunk changed hash).
- PHP side untouched: `254 passed`, PHPStan 0, Pint clean.

The caller stops passing a radius and passes nothing; the signature's second parameter is a gap now, with one call site, as in #100.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.