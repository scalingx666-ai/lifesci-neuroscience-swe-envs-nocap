# Issue

**Title:** [REF] Replaces numpy_groupies with np.bincount

## Description

Replaces all instances of `numpy_groupies.aggregate` with equivalent calls to `np.bincount`.

Also removes dependency for `numpy_groupies` from setup.py and requirements.txt.

Finally, adds a context manager to `mesh_smooth` so that an "invalid value" warning isn't unnecessarily raised.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c3d631c9b3e9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.