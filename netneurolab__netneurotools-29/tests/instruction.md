# Issue

**Title:** [ENH] Adds exact matching in stats.gen_spinsamples

## Description

Adds the optional kwarg `exact` to `stats.gen_spinsamples()`, which allows user to specify whether each coordinate location must be uniquely re-assigned for every rotation. This diverges from the traditional
implementation of the spin test by Alexander-Bloch et al., but may be a desired feature when using nodal/regional parcellations rather than vertices.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `335b99fa33a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.