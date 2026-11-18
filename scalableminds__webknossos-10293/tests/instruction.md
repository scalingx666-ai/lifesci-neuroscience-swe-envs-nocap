# Issue

**Title:** Remove the legacy per-mag voxel map labeling

## Description

### Summary
Stacked on #10292, which moves all volume tools onto the new volume architecture. Removes the labeling code that this leaves unused (~1,400 lines, no behavior change):
- `volume_annotation_sampling.ts`, which sampled a voxel map to the other mags, and its spec
- `applyLabeledVoxelMapToAllMissingMags`, `Bucket.applyVoxelMap` and the `LabeledVoxelsMap` types
- comments that referred to them now point to the volume core, and the design doc marks the removal of the old paths as done

### Steps to test:
- No behavior change; the volume tools work as in #10292.

### Issues:
- contributes to #9982

------
(Please delete unneeded items, merge only when none are left open)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9bce7adc87ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.