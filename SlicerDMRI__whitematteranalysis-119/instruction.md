# Issue

**Title:** BUG: fix transform hardening for Slicer

## Description

As of the commit linked below, Slicer assumes that models with no explicitly declared space should be LPS.  For FiberBundles, SlicerDMRI explicitly defines the contents to be RAS if the space is not declared, for backwards compatibility.

The change in the commit uses the `loadFiberBundle` method to explicitly use the SlicerDMRI reader so that the tracts are correctly interpreted.

The `loadFiberBundle` method existed in 4.10.2 (actually since 2011) so no current users should have any problem with this change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8dc9674e1259`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.