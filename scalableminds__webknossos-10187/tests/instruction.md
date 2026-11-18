# Issue

**Title:** Render brush preview in the brush mag and make brush shape independent of sub-voxel position

## Description

### Summary
- The brush preview was always drawn on the mag-1 voxel grid, even if the brush is applied in a coarser mag (e.g., the volume layer only has mag 4 while the color layer renders mag 1). It is now drawn in the mag in which the brush labels (`getRenderableMagForActiveSegmentationTracing`) and matches the painted voxels.
- The brush center is snapped by `getBrushCenterInMag`, which is shared by the brush saga and the preview shader:
  - odd diameter (in brush-mag voxels): center of the hovered voxel, so the brush is symmetric around it
  - even diameter: nearest voxel corner, so the brush is exactly as wide as its size. The center therefore changes when the cursor crosses the middle of a voxel (intended: a fixed corner would offset the brush from the cursor by half a voxel)
  - Previously, the shape depended on the sub-voxel mouse position in coarser mags.
- Voxels exactly on the border are no longer painted and the radius isn't rounded anymore. This removes the single-voxel "poles", and a brush of size 1 paints exactly the hovered voxel.
- The draw/erase actions now additionally carry the floating mouse position (only used by the brush).

### Steps to test:
- Brush with size 1: only the hovered voxel should be painted
- Brush with odd sizes (e.g., 5, 7): the shape should be symmetric around the hovered voxel without single-voxel bumps at the edges
- Brush with even sizes (e.g., 2, 4): the shape should be exactly as wide as the brush size and follow the closest voxel corner to the cursor
- Open an annotation with a volume layer that only has a coarse mag (e.g., mag 4) and zoom in so that the color layer renders mag 1. The preview should consist of 4×4 blocks. It should only move when the cursor crosses a mag-4 voxel boundary if the diameter in mag-4 voxels is odd (e.g., size 12 = 3 voxels), or the middle of a mag-4 voxel if it is even (e.g., size 16 = 4 voxels)
- In all cases, check that the labeled area matches the preview voxel by voxel

### Issues:
- contributes to 

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bea3a382c84e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.