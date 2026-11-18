# Issue

**Title:** FIX DataView.loaded race causing blank canvas in multi-data viewers

## Description

.

## Summary

After  (`28129b3e`), `cortex.webgl.make_static` viewers
intermittently render a blank canvas on initial load when the `.npy`
textures finish downloading before the CTM mesh has been parsed.
DevTools shows:

```
TypeError: can't access property 0, event.value is undefined
  at SurfDelegate.setAttribute (mriview_surface.js:740)
  at VertexData.set            (dataset.js:496)
  at DataView.setFrame         (dataset.js:274)
  at Viewer.setData            (mriview.js:377)
```

## Root cause

In the `DataView` constructor, the loaded aggregation looped over every
child every time `$.when()`'s combined progress fired:

```js
deferred.progress(function (available) {
    for (var i = 0; i < this.data.length; i++) {
        if (available > this.delay && !allready[i]) {
            allready[i] = true;          // <-- marks EVERY i
            ...
            if (test) this.loaded.resolve();
        }
    }
})
```

`$.when`'s combined progress callback doesn't say which source fired, so
the first child's notify flips **every** `allready[i]` to true and the
test passes. `DataView.loaded` resolves as soon as the first child's
verts push lands — the sibling `VertexData`'s `verts` is still `[]`.
`setData`'s `this.active.set()` (added in #635 to make picker xfm correct
on dataset switch) then iterates `data[i].set()` for both children, and
`data[1].set()` dispatches `{ value: this.verts[0] } === { value:
undefined }`, crashing `SurfDelegate.setAttribute` on `event.value[0]`.

The race already existed but was harmless before #635, when `setData`
never called `this.active.set()` on the initial load.

## Fix

Register on **each** child's `.loaded` deferred individually, so
`allready[idx]` is only set when `data[idx]` actually notifies (or
resolves, for the 1D path). `DataView.loaded` only resolves once every
child has notified — by which time every child has pushed verts inside
its `subjects[subject].loaded.done` callback, so `active.set()` finds
populated buffers.

## What didn't work

The first commit on this PR wrapped `VertexData.loaded.resolve()` in
`subjects[subject].loaded.done(...)` thinking the race was inside
`VertexData`. That was a no-op for the multi-D arrays that make_static
actually emits: `NParray.update` only `notify`s `array.loaded` for
shape `(1, nverts)`, never `resolve`s it, so the outer `.done` handler
at `dataset.js:484` doesn't fire and adding another wait inside it
changes nothing. That commit is reverted in the follow-up.

## Test plan

- [x] `pytest cortex/tests/test_webgl_headless.py -k "not visual_comparison and not addData"` — 13 tests pass with zero page errors (all 6 dtypes, NaN-mask regressions, RGB alpha regressions, capture roundtrip, overlay visibility)
- [x] Manual (mvdoc): `make_static` viewer over `python -m http.server`, hard-reload 10+ times in Firefox/Chrome — every reload should render with no `event.value is undefined` console errors

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28129b3e7b04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.