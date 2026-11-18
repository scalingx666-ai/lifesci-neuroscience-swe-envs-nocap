# Issue

**Title:** Fix cmap=ListedColormap raising 'unhashable type' and add regression tests

## Description

## Summary

- `build_plotter` does `cm in colormaps` where `colormaps` is a dict. Passing a matplotlib `ListedColormap`/`LinearSegmentedColormap` instance therefore raised `TypeError: unhashable type: 'ListedColormap'`.
- Reported by a hippomaps user calling `surfplot_canonical_foldunfold(..., cmap=cmc.devon, ...)` after reinstalling brainspace; works around with a string cmap name only.
- Master already guarded the dict lookup with `isinstance(cm, str)`, but still leaned on `plt.get_cmap(cm)` to coerce the non-string branch. This PR makes the path explicit (Colormap instance vs. string vs. unsupported type) and pins the contract with regression tests so the bug can't slip back in.

### Changes

- `brainspace/plotting/surface_plotting.py`
  - Import `matplotlib.colors.Colormap`.
  - In `build_plotter`'s LUT block: accept `Colormap` instances directly, route strings through `plt.get_cmap`, and raise a clear `TypeError` for anything else.
  - Update `cmap` docstrings on `build_plotter`, `plot_surf`, and `plot_hemispheres` to document Colormap-instance support.
- `brainspace/tests/test_plotting.py` — 7 new regression tests:
  - `ListedColormap` and `LinearSegmentedColormap` instance cases (the original bug)
  - Matplotlib string names continue to work
  - brainspace-registered names (`BuGyRd`) continue to resolve to the precomputed lookup
  - Mixed string + Colormap across layout cells
  - Invalid cmap types raise a clear `TypeError`
  - End-to-end `plot_surf` smoke test with a Colormap instance

## Test plan
- [x] `pytest brainspace/tests/test_plotting.py brainspace/tests/test_colormaps.py` — 19 passed locally on macOS / Python 3.10 / matplotlib 3.10.
- [x] Manually reproduced the original failure (`ListedColormap in colormaps` -> unhashable) and confirmed `build_plotter(..., cmap=ListedColormap(...))` now succeeds.
- [ ] CI (Linux/macOS, Python 3.9-3.13) green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19d7786bab70`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.