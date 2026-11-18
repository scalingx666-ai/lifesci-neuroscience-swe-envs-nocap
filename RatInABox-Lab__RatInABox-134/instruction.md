# Issue

**Title:** Minor plotting modifications

## Description

**Issue 1:** When plotting the shaded area in `mountain_plot()` using `fill_between()`, very large polycollections may be created (given thousands of time points). This can cause problems (i.e., the `fill_between()` object corrupting an illustrator file).
=> **Solution:** Enabled a `skiprate` for plotting shade in `mountain_plot()` using `fill_between()`. Allows the user to reduce the resolution of the shaded area.

**Issue 2:** Wall thickness cannot be adjusted for different subplot sizes.
=> **Solution:** Added a `wall_lw` keyword argument to `Environment.plot_environment()` to allow users to control the linewidth of the walls.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a89d6f20cb6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.