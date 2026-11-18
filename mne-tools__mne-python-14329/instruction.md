# Issue

**Title:** Dont require PyVistaQt in notebook

## Description

Just a tiny cleanup -- you should be able to use notebook with just `pyvista`, not `pyvistaqt`, so let's move the `pyvistaqt` stuff to `_qt` and nest the import in `mne/viz/backends/_pyvista.py`.

This is a trivial cleanup so self-marking for merge-when-green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b121f6b4da68`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.