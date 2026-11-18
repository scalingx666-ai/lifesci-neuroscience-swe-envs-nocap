# Issue

**Title:** Integrate better with Jupyter notebook

## Description

Mayavi can render things inside a jupyter notebook as either PNG or X3D.
This functionality can be enabled with `mlab.init_notebook()`.

This PR adds an `_ipython_display_` hook to the `Brain` class that
renders the brain accordgin to the Mayavi notebook integration settings.

This means interactive PySurfer brains in Binder are now possible!
https://mybinder.org/v2/gh/wmvanvliet/SNL_workshop_2019/master?filepath=pysurfer_demo.ipynb

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `df6852705bcb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.