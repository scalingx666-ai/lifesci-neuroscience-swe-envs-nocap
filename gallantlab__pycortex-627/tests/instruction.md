# Issue

**Title:** FIX Vertex objects without NaNs rendering as fully transparent

## Description

## Summary

. After #612, plain `cortex.Vertex` objects with no NaN data showed up fully transparent in the WebGL viewer.

## Root cause

#612 added a `nanmask` vertex attribute that [`surface_vertex`](cortex/webgl/resources/js/shaderlib.js) checks unconditionally:

```glsl
if (nanmask < 0.5) vColor = vec4(0.);
```

But [`dataset.js`](cortex/webgl/resources/js/dataset.js) only built and pushed the mask when the data actually contained NaNs. With no NaNs, the `nanmask` attribute fell back to the default empty `Float32Array` initialized in [`mriview_surface.js`](cortex/webgl/resources/js/mriview_surface.js), so every vertex read `nanmask = 0` and got `vColor = vec4(0.)` — the entire surface was rendered transparent.

## Fix

Always build a `nanmask` per frame, filled with `1.0` everywhere when the data is NaN-free. This also fixes a latent indexing bug for movies where some frames had NaNs and others didn't — `nanmasks[fframe]` was index-mismatched with `verts[fframe]`, since masks were only pushed for NaN frames.

## Reproducer (from issue #626)

```python
import cortex
vtx = cortex.Vertex.random("S1")
cortex.webgl.show(vtx)
```

Before this PR: surface is fully transparent. After this PR: surface renders normally, and Vertex data with NaNs still renders NaN positions as transparent (the original #612 behavior is preserved).

## Test plan

- [x] Manual: `cortex.webgl.show(cortex.Vertex.random("S1"))` renders the random data on the surface
- [x] Manual: `cortex.webgl.show(cortex.Vertex(data_with_nans, "S1"))` still shows NaN positions as transparent (regression check for #612)
- [x] Manual: multi-frame Vertex with NaNs in only some frames renders each frame correctly

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c70ddf5f1607`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.