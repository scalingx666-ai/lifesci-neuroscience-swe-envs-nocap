# Issue

**Title:** [bug] Fix test bug

## Description

This pull request includes a small but important change to the `brainpy/_src/math/op_register/ad_support.py` file. The change modifies how zero tangents are created from primal values in the `_standard_jvp` function.

* [`brainpy/_src/math/op_register/ad_support.py`](diffhunk://#diff-41c1e42a6317f685354a4edf87f781939f40f51c3fc223d0811ef3acfb80bed4L46-R46): Changed the lambda function to use `ad.Zero.from_primal_value` instead of `ad.Zero.from_value` when mapping over `val_out`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a5adea09aeb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.