# Issue

**Title:** FIX NaN values in Volume/Vertex rendering as black instead of transparent

## Description

NaN values in `Volume.raw` / `Vertex.raw` render as opaque black instead of transparent. After colormap conversion to uint8, NaN information is lost, so the alpha getter's `np.isnan(rgb)` check on uint8 data is always `False`. Additionally, `Vertex` objects with NaN data render as colored (not transparent) in the WebGL viewer due to missing NaN detection in the `surface_vertex` shader.

```python
vtx = cortex.Vertex(data_with_nans, subject, vmin=-2, vmax=2, cmap="RdBu_r")
raw = vtx.raw
raw.alpha = np.ones(n_verts) * 0.8  # NaN positions rendered as black
```

### Changes

- **`Dataview.raw`**: Capture NaN mask before uint8 conversion, explicitly zero out alpha for NaN positions
- **`Volume.raw` / `Vertex.raw`**: Store `_nan_mask` on the returned RGB object so it survives alpha overrides
- **`VolumeRGB.alpha` / `VertexRGB.alpha` getters**: Apply stored `_nan_mask` to enforce alpha=0 for NaN positions, even after user sets a custom alpha channel
- **`surface_vertex` WebGL shader**: Add NaN detection in the colormap lookup using the GLSL idiom `cuv.x != cuv.x`. When vertex data is NaN, set `vColor = vec4(0.)` so the fragment shader discards the vertex. Handles both 1D and 2D cases. The `surface_pixel` shader already had NaN detection via `colorlut()`, but `surface_vertex` was missing it.
- **Tests**: Four new tests covering default and user-overridden alpha for both Volume and Vertex

<!-- START COPILOT CODING AGENT TIPS -->
---

⚡ Quickly spin up Copilot coding agent tasks from anywhere on your macOS or Windows machine with [Raycast](https://gh.io/cca-raycast-docs).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a29daad6f6a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.