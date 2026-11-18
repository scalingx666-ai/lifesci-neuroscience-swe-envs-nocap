# Issue

**Title:** Fix for trame-pyvista

## Description

Fixes failure in  due to 0.3 release

Once  lands I'll add `trame-pyvista` to `pip-pre` to make us find out about any compat breaks sooner, too

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b73513b76f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.