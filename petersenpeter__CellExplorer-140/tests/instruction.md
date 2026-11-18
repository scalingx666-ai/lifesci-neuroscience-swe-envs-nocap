# Issue

**Title:** Improve Open Ephys and tracking preprocessing

## Description

Add Neuropixels 1.0 geometry detection, multi-line TTL loading, and fallback metadata imports for unsupported GUI versions. Fix LFP chunk boundaries and sampling-rate overrides, with explicit overwrite controls. Support selecting Optitrack entries and correct coordinate rotation and per-sample trial labels.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9a14c2cf8dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.