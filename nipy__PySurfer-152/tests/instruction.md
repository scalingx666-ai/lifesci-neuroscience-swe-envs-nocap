# Issue

**Title:** MRG: Py3k support

## Description

Brings PySurfer py3k support. No CI support yet because Anaconda packages don't exist yet. But tests pass on my system with Mayavi dev and VTK 7.0.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e704ac3b4241`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.