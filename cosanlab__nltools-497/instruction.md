# Issue

**Title:** fix(viewer): the threshold floor can never reach zero

## Description

## Summary

`iplot()`'s window is a *magnitude* window — niivue mirrors `[cal_min, cal_max]` onto the negative limb — so a floor of zero (or below) admits every zero-valued voxel, i.e. everything outside the mask, and the whole volume box paints in the negative colormap (solid blue). The slider spanned the data range from its minimum, so dragging the floor left of zero did exactly that (reproduced on dartbrains' ICA component viewer); `iplot(threshold=0)` or `lower=-x` did the same from Python.

- `threshold_slider_bounds` now spans `(0, max|v|]` with a lower bound one step above zero; handles default to that bound (show everything except exact zeros) and `max|v|`; explicit `cal_min`/`cal_max` are taken as magnitudes and a floor `<= 0` is raised to the bound. `build_viewer` stores the effective window in the traits.
- `viewer.js` clamps the applied floor to a positive epsilon (and keeps the ceiling above it) whatever the slider or the model supplies, including the initial `NVImage` window.
- `iplot` docstring states the magnitude semantics.

## Test plan

- [x] full `pytest nltools/tests` passes; `node --check viewer.js`; `ruff check`
- [x] `TestThresholdSliderBounds` rewritten for the magnitude window (positive floor, `max|v|` ceiling, zero/negative floor raised, all-zero and constant data fall back sanely); `TestControls`/`TestThreshold` cover `threshold=0` and a negative `lower`
- [x] Before/after captured in a browser on a built static page: floor at the old slider minimum → entire volume box blue; floor at zero → every voxel painted

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_012xzEFw9vZWtExYbF6okmxG

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aefacfd8be84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.