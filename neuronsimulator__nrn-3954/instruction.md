# Issue

**Title:** PlotShape without a display starts with v, as with one

## Description

.

A `PlotShape` without a display (`ShapePlotData`) had no variable until `variable()` was called, while one with a display (`ShapePlot`) starts with `v`, which is also what the PlotShape docs say. So `nrn_get_plotshape_varname` gave `""`, and `ps.plot(pyplot)` or `ps.plot(plotly)` without a display didn't color the shape by v. `ShapePlotData` now starts with `v`, looked up the same way as in `ShapePlotImpl` (`hoc_table_lookup("v", hoc_built_in_symlist)`).

So a no-display `ps.plot(...)` without `variable()` is now colored by v, as with a display. For a default `PlotShape(False)`, `get_plotshape_data` gives `('', None, -80.0, 40.0)` on 9.1.0.dev46 and `('v', None, -80.0, 40.0)` with this, the same as after `ps.variable("v")`.

`test/api/plotshape_interface.cpp` now checks the default name too. It fails without the change ("FAIL: default varname") and passes with it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `783998a5fdad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.