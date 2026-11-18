# Issue

**Title:** feat: add cortical region boundary contours (contours parameter)

## Description

## Summary

Adds a `contours` parameter to `plot_cortical` for drawing atlas region boundary lines on the surface, with support for selective regions and per-region styling.

## Changes

### `yabplot/mesh.py`
- `get_region_boundaries`: new `region_ids` filter (draw outlines for specific regions only) and `smooth_iterations` (Laplacian smoothing on boundary line vertices to reduce triangular jaggedness — especially useful with `proc_vertices='sharp'`).

### `yabplot/plotting.py`
- New `contours` parameter on `plot_cortical` (replaces earlier draft's `draw_contours` + `contour_regions`).
- `_build_contour_layers()` helper resolves `contours` into a list of `(lh_mesh, rh_mesh, kwargs)` render groups, allowing multiple style groups per call.
- Smoothing auto-set to 10 iterations when `proc_vertices='sharp'`, otherwise 0 (user-overridable).

### `docs/tutorials/plot_styling.ipynb`
- Section 5 updated with all `contours` forms and a sharp-mode smoothing example.

## API

```python
# all regions, default style
plot_cortical(data, atlas='schaefer400', contours=True)

# all regions, custom global style
plot_cortical(data, atlas='schaefer400', contours={'color': 'white', 'line_width': 1.5})

# only regions with data (bool mask)
plot_cortical(data, atlas='schaefer400', contours=~np.isnan(data))

# specific regions by name
plot_cortical(data, atlas='schaefer400', contours=['region_A', 'region_B'])

# per-region style (only listed regions get contours)
plot_cortical(data, atlas='schaefer400', contours={
    'region_A': {'color': 'red',  'line_width': 3.0},
    'region_B': {'color': 'blue', 'line_width': 3.0},
})

# sharp mode — contours auto-smoothed (smooth_iterations=10)
plot_cortical(data, atlas='schaefer400', contours=True, proc_vertices='sharp')

# override smoothing manually
plot_cortical(data, atlas='schaefer400', contours={'smooth_iterations': 20})
```

## `contours` disambiguation

| type | detection | behavior |
|---|---|---|
| `False` / `None` | — | no contours |
| `True` | — | all regions, default style |
| dict with primitive values | values are not dicts | all regions, custom style |
| list / bool ndarray | — | those regions, default style |
| dict with dict values | all values are dicts | per-region style, only listed regions |

## Breaking changes

None — `contours` defaults to `False`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9ef84bfbb68`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.