# Issue

**Title:** Fix: two fingers on a trackpad resize the canvas instead of moving it

## Description

> **Stacked on #108**, which is stacked on #107, #99, #100 and #101. The last commit is this PR; the six below it are that stack. No other merged branch touches `frontend/src`.

## Two-finger scroll zooms

macOS sends a two-finger scroll as a wheel event like any other, and d3-zoom zooms on every wheel. The `deltaX` a trackpad reports was being read as scale, so **scrolling a graph sideways was not possible at all** — the gesture that means "look to the left" made the graph smaller.

A trackpad scroll now pans. A pinch and a mouse wheel still reach d3 and still zoom, so zooming stays anchored on the pointer exactly as d3 does it.

Deltas arrive in screen pixels while `translateBy` moves the graph's own coordinates, so they are divided by the current scale. Without that, panning drifts against the pointer at every zoom level except 100%.

## The part that needs your judgement

**Nothing in the event says which device sent it.** A notch of a mouse wheel and two fingers on a trackpad arrive the same shape. A pinch is the one case the browser marks, by setting `ctrlKey`. Everything else is inference, and the choice of what to infer is a product decision as much as a technical one:

- **Wheel pans, ctrl-wheel zooms** — what Figma, Miro and Excalidraw do. No inference needed, works on every device, and a mouse-wheel user loses zoom-on-scroll.
- **Infer the device** — a mouse keeps zooming and a trackpad pans, at the cost of a heuristic that will be wrong on some hardware.

This PR implements the second, because that is what the person who reported it wanted. **I would take a redirect to the first without argument** — it is less code, it cannot be wrong about a device, and the convention is well established. Say the word and I will swap it.

## The inference is measured, not assumed

389 real events captured from a MacBook trackpad in Chrome — two-finger scrolls, diagonal scrolls, pinches:

| gesture | events | what they carry |
|---|---:|---|
| scroll | 354 | `wheelDeltaY === -3 * deltaY` in 350, off by one unit in 4; `deltaX` frequently non-zero; `deltaY` whole; largest `\|deltaY\|` was **49** |
| pinch | 35 | `ctrlKey` set; `wheelDeltaY` pinned at exactly ±120 while `deltaY` stayed fractional and under 9 |

That `-3` ratio is the signal. It identifies a trackpad **positively**, rather than inferring one from the absence of a mouse — a notch reports `deltaY` around 100 against a `wheelDeltaY` of 120, a ratio of -1.2, nowhere near it.

The pinch row is also why `ctrlKey` has to be tested first rather than folded in: a pinch's `wheelDeltaY` is *always* a multiple of 120, so any rule keying on that alone reads every pinch as a mouse. I had written exactly that rule before measuring.

Fallbacks for what the capture could not cover: a non-zero `deltaX` (a wheel has one axis), a `deltaMode` other than pixels (mice on Firefox and Windows, never a trackpad), and a coarse whole `deltaY` where `wheelDeltaY` is absent (Firefox).

## What is not verified, and cannot be by me

**No mouse was available to test with.** Every path ending in "this is a mouse" is reasoned from Chrome's documented shapes, not measured. The known gap is written into the function: a high-resolution wheel reporting `deltaY` 40 against a `wheelDeltaY` of -120 hits the ratio exactly and would be read as a trackpad.

If you have a mouse to hand, logging `{deltaX, deltaY, deltaMode, wheelDeltaY}` from it is the one measurement that would close this, and `isTrackpadPan` is the only function to change.

## Verified

Measured event shapes replayed through the built handler, overriding `wheelDeltaY` because Chrome derives a different value for synthetic events than the hardware sends — which is itself worth knowing, since it means a naive synthetic test of this function passes for the wrong reason:

```
five trackpad shapes, including the rounding outlier  ->  pan,  5/5
two pinch shapes                                      ->  zoom, 2/2
three mouse shapes (unmeasured, from Chrome's docs)   ->  zoom, 3/3
```

And the panning itself, before the device split was added:

```
two-finger (60, 40)      ->  screen (-60, -40), scale unchanged
same at k = 0.18, 1.2, 5 ->  screen (-50, -25) every time
pinch                    ->  point under the cursor identical before and after
mouse drag (80, 60)      ->  screen (+80, +60), scale unchanged
```

The scale-independence is what asserts the division is right. The drag is there because the zoom filter changed and mouse panning goes through it.

`tsc -b` clean, `npm run lint` clean, `254 passed (853 assertions)`, PHPStan clean, Pint clean. Rebuilding the branch from scratch reproduces the shipped chunk's content hash; one entry chunk ships and the superseded one is deleted.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.