# Issue

**Title:** Fix save_3d_views crashing IPython/Jupyter kernels

## Description

. My guess is that `tornado.ioloop.IOLoop.current()` returns something different if it's being run in a Jupyter notebook, since Jupyter itself uses tornado.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a55c4f1cf5a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.