# Issue

**Title:** WebGL viewer: make opacity slider and `o` toggle work for Vertex data

## Description

## Problem

With a `Vertex` (or `Vertex2D` / `VertexRGB`) dataset, the **opacity** slider in the surface folder and the `o` shortcut did nothing, while both work for `Volume` data.

Both controls drive the `dataAlpha` uniform. The volume shaders apply it (`vColor *= dataAlpha;` in `Shaders.main` and `Shaders.surface_pixel`), but the `surface_vertex` fragment shader only *declared* `dataAlpha` (via `standard_frag_vars`) and never read it, so the uniform changed and the pixels didn't.

The `o` shortcut itself already existed (`Surface.toggleOpacity`, listed in the `h` help overlay and in `docs/userguide/webgl.rst`) — it just looked broken for vertex data because it only flips `dataAlpha`.

## Changes

- **`shaderlib.js`** — in `surface_vertex`, scale the interpolated data colour by `dataAlpha` before compositing over the curvature (`vec4 dColor = vColor * dataAlpha;`). `vColor` is a varying, hence the local. Scaling all four channels keeps the premultiplied-alpha convention of the volume path (and of #631), so opacity 0 yields pure curvature.
- **`mriview_surface.js`** — `toggleOpacity` now remembers the last visible opacity instead of rounding it (0.7 → 0 → 0.7 rather than 0.7 → 0 → 1), and no longer leaks an implicit global `surface`.
- **`test_webgl_headless.py`** — new `test_vertex_opacity_slider_fades_data`: renders a saturated-red `Vertex` at opacity 1 → 0 → 1 in one viewer session and counts red-dominant pixels. Fails on `main` (53,760 red pixels at opacity 0), passes with the fix.

## Verification

- Full `cortex/tests/test_webgl_headless.py`: 43 passed, 1 skipped (pre-existing manual visual test).
- Rendered `Vertex`, `VertexRGB` and `Volume` at opacity 1 / 0.5 / 0 — `Vertex` now fades into the curvature exactly like `Volume`; `Volume` output unchanged.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01P8oA4mUvTLd7sbs9iFaqM8

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dabd51ca2e71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.