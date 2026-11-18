# Issue

**Title:** FIX WebGL viewer hover/click readout for Vertex2D / Volume2D

## Description

.

## Summary

- Hover and click handlers now display both channel values for `Vertex2D` / `Volume2D` as `(v1, v2)`. The bail-out condition `data.length != 1` was hiding both indicators on 2D views even though both channels reach the browser intact (`Dataview2D.uniques` yields dim1 and dim2 as separate brain entries).
- **`Volume2D` picker fix (latent bug surfaced by the readout work):** for 2D views `dataview.xfm` is `[xfm_dim1, xfm_dim2]`, but `PickPosition.apply` was spreading that as two positional args to `Matrix4.set`, leaving the picker matrix full of `NaN`. Voxel coords resolved to `(0,0,0)`, which is why the new readout initially showed `(0, 0)` always. The fix mirrors the `volxfm` length check from `VolumeData.init` and uses dim1's transform (both share `xfmname` server-side).
- **Vertex views explicitly NaN the picker matrix.** A stale volume xfm would otherwise bleed through after switching from a Volume view and draw voxel-axis crosshairs across an inflated brain. Vertex picks aren't voxel picks; suppressing the marker matches the implicit pre-existing behavior (`set.apply(xfm, undefined)` invoked `Matrix4.set()` with no args).
- **Geometry guard for client-side `dataset.makeFrom`.** That path pairs two arbitrary 1D dataviews into an ad-hoc 2D view, only checking "both volume or both vertex" — it can produce a 2D view with divergent `shape`/`mosaic`. The hover/click code reuses `data[0]`'s `mouse_index` for both channels, so divergent geometry would yield a wrong-but-plausible second value. Hide the indicators in that case rather than mislead.
- **Refresh indicators on dataset switch.** Cache the last hover and pick screen coordinates and re-fire after the new dataview loads, with a `dataBuffersReady` guard for the brief window between `dataview.loaded` resolving and child `VertexData`/`VolumeData` buffers populating.

## Files changed

- [`cortex/webgl/resources/js/mriview.js`](cortex/webgl/resources/js/mriview.js) — handlers, `volumeGeomsMatch` / `dataBuffersReady` helpers, `setData` reset+refire.
- [`cortex/webgl/resources/js/facepick.js`](cortex/webgl/resources/js/facepick.js) — `PickPosition.apply` xfm dispatch.
- `.gitignore` — ignore the per-worktree `.claude/` scratch dir.

## Test plan

- [x] Existing `cortex/tests/test_webgl_headless.py::test_datatype_renders` (Volume / Vertex / VolumeRGB / VertexRGB / Volume2D / Vertex2D) — 6/6 pass.
- [x] End-to-end Playwright probe for hover and click on each of: `Vertex` (1D), `Volume` (1D), `Vertex2D`, `Volume2D`, `VertexRGB`, plus a regression case for `dataset.makeFrom` pairing two `Volume`s with divergent `xfmname` (S1 fullhead × retinotopy → 100³ vs 72³ shape) — all 6 pass.
- [x] Interactive: confirmed `Vertex2D` shows `(-0.670, 1.98)` (matches `Vertex` 1D's first channel for same RNG seed); `Volume2D` shows `(-1.00, -1.14)` (matches `Volume` 1D's first channel); `VertexRGB` indicators stay hidden; voxel crosshairs do not appear on vertex views; switching datasets refreshes the picked indicator without showing a stale value.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c37dd70455f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.