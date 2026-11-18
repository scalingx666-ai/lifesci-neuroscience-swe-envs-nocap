# Issue

**Title:** fmri_surface_data.surface: space-matched default view, render perf fix, docs

## Description

(the `fmri_surface_data` object). Three commits, cherry-picked onto current `master` so they apply cleanly on top of the squash-merge.

## 1. Space-matched default four-surface view
`surface(obj)` with no explicit surface argument now picks a four-surface view (L/R lateral + medial) matched to the object's `surface_space`, so data renders at native (or near-native) fidelity by default:

| `surface_space` | verts/hemi | default view | how it paints |
|---|---|---|---|
| `fsLR_32k` | 32,492 | `foursurfaces_hcp` | native (direct) |
| `fsaverage_164k` | 163,842 | `foursurfaces_freesurfer` | native (direct) |
| `fsaverage6/5/4` | 40,962 / 10,242 / 2,562 | `foursurfaces_freesurfer` | resampled up to 164k (nearest, cached) |
| `onavg_41k/10k` | 40,962 / 10,242 | `foursurfaces_hcp` | resampled to fs_LR (nearest, cached) |

No new mesh assets needed: nested fsaverage spaces are subsets of fsaverage-164k and onavg is fs_LR-aligned via the vendored onavg spheres, so each renders on its parent/aligned display space through the fast, cached nearest resample already in `render_layer_surfaces` (prints a one-line message when it resamples). Previously every non-fs_LR/-164k space fell back to `foursurfaces_hcp`, forcing an unnecessary cross-family resample.

Also fixes a parser bug in `@fmri_surface_data/surface.m`: a bare surface keyword (`surface(obj,'foursurfaces_hcp')`, `surface(obj,'hcp inflated left')`) fell into the colour-option branch and indexed past the end of `varargin`. Non-mode tokens are now split into colour options vs surface directives; directives override the space-matched default view.

## 2. Render performance regression fix
Cortex-only fs_LR data on `foursurfaces_hcp` had regressed to ~48 s because incidental subcortical anatomy meshes triggered a needless volume projection. Now arbitrary (non-standard) meshes are deferred per view and projected **only** when no native/resampled cortical patch painted in that view — `addblobs` is back to ~0.2 s. `to_display_volume` also uses nearest (not barycentric) for its display-only cortex resample (~250× faster: 0.2 s vs 48 s; the barycentric weight-build was the entire bottleneck). Arbitrary-mesh renders (`hires left`, `cutaway`) drop from ~48 s to ~0.8 s.

## 3. Docs
Per-space default-view table added to both the comprehensive reference (`CanlabCore/docs/`) and the readthedocs functional index (`docs/`); refreshed the Surface-spaces section (all 7 spaces; `resample_surface` is implemented) and corrected the surface() space-mismatch text.

## Tests
New `test_default_view_matches_space` in `canlab_test_surface_render.m`. Surface render + fmridisplay suites pass locally (24/24) on R2026a + SPM25.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a007b86e066`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.