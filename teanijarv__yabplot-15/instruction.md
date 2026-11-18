# Issue

**Title:** Add color-grouping + per-region export options to plot_subcortical

## Description

## Summary

Adds three new keyword arguments to `plot_subcortical` for controlling region coloring/export in atlas mode (i.e., no data passed in), plus a naming helper and test coverage. Builds on top of the `.round()` fix from #14 — no further changes to `atlas_builder.py`.

### Motivation

The functionality introduced in this PR is designed to increase user flexibility in region rendering separately for visibility of occluded regions. Additionally, this functionality is designed to integrate with the [`subcortex_visualization`](https://github.com/anniegbryant/subcortex_visualization) pipeline for converting from three-dimensional NIFTI volume to mesh to two-dimensional vector graphic.

### What has changed

* `hemisphere_colors` (bool, default `False`): Bilateral region pairs (e.g., left/right putamen) share one color instead of each getting its own, via a new get_base_name() helper that strips hemisphere naming conventions (_l/_r, -lh/-rh, l-/r-, left_/right_/etc). 
* `shuffle_colors` (bool, default `False`): Reproducibly (seed-fixed) shuffles the generated palette across regions to help separate adjacent regions with similar neighboring colors. 
* `plot_regions_separately` (bool, default `False`): Renders one transparent-background PNG per region/view (`{region}_{view_face}.png`) into `export_path` as an output directory, for downstream SVG-tracing pipelines. Returns `None` in this mode. 
* `cmap` can now optionally drive atlas-mode region colors too (sampled across `linspace(0, 1, n_regions)`) when explicitly passed as a colormap name. This is opt-in only; default behavior (`generate_distinct_colors`) is unchanged.

### Testing

Unit tests were added for `get_base_name`, `hemisphere_colors=True`, and `plot_regions_separately=True`. The full suite (51 tests) passes locally via `uv run pytest tests/`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b71876f5e02f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.