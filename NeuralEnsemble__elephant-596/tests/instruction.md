# Issue

**Title:** [Doc] readthedocs: configuration key build.image is deprecated, changed to build.os

## Description

**This PR will fix the failing documentation build on readthedocs, due to latest changes.**

The `readthedocs.yml` specifies the build configuration for the docs build on readthedocs. 

The configuration key `build.image` is deprecated, and replaced by `build.os`.

```
Error

The configuration key "build.image" is deprecated. Use "build.os" instead to continue building your project. Read more at https://docs.readthedocs.io/en/stable/config-file/v2.html#build-os
```

**Fix bug in unitary events tutorial related to matplotlib:**

Wit release of matplotlib 3.8.0 the join method for sharing axis was removed.

This PR fixes the shared y-axes, by following the recommendation to use Axes.sharey() instead.

See: https://matplotlib.org/3.8.0/api/prev_api_changes/api_changes_3.8.0.html#removals
Modifications to the Groupers returned by get_shared_x_axes and get_shared_y_axes are no longer allowed. Note that previously, calling e.g. join() would already fail to set up the correct structures for sharing axes; use [Axes.sharex](https://matplotlib.org/3.8.0/api/_as_gen/matplotlib.axes.Axes.sharex.html#matplotlib.axes.Axes.sharex) or [Axes.sharey](https://matplotlib.org/3.8.0/api/_as_gen/matplotlib.axes.Axes.sharey.html#matplotlib.axes.Axes.sharey) instead.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c3eb21fb904b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.