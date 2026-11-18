# Issue

**Title:** fix: replace removed embedWindow with correct vedo backend instructions

## Description

## What does this PR do?
Fixes the misleading error message in `brainrender/_jupyter.py` that 
referenced `vedo.embedWindow`, which has been removed from the vedo library.

## Why is this needed?


## Changes
- Removed all references to the non-existent `embedWindow` API
- Updated the error message in the `not_on_jupyter` decorator to direct 
  users to set `vedo.settings.default_backend = 'k3d'` for notebook use
- Added a note that some features are unavailable in k3d, and recommends 
  running in a standard Python script or terminal for full functionality

## How was this tested?
- Verified valid vedo backend values directly from vedo 2026.6.1 source code
- `"k3d"` confirmed as the correct notebook backend in vedo settings

## Is this a breaking change?
No

## Does this require a documentation update?
No

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42c6ef196d97`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.