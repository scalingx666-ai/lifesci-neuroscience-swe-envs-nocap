# Issue

**Title:** Add gap junction connector

## Description

This adds a basic gap junction connector, which is compatible with the 3D Viewer and Connectivity widget. Gap junctions are currently ignored by all other widgets. The feature does not affect any current functions and does not clutter the compatible widgets (only adds one "show gap junctions" checkbox to the Connectivity widget). Gap junctions are added using the alt Key alone, as it did not previously have any functions (shift+alt and other combinations still work as previously).

We would like to use this feature to annotate and analyse gap junctions in _C. elegans_ serial electron microscopy data sets, where gap junctions are visible and essential for neuronal circuit functions. We hope that you agree with our additions, as it would help everyone in the _C. elegans_ community using CATMAID.

The feature has previously been suggested in .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e003a1ab2e37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.