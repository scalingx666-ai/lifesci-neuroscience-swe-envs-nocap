# Issue

**Title:** Draw bounding box cross sections correctly in rotated viewports

## Description

### Summary
When the viewport was rotated, bounding box outlines in the XY/YZ/XZ viewports were still drawn as flat, axis-aligned rectangles. The tilted data plane hid most of that rectangle, and it didn't match where the slice actually cuts the box. Now the outline is the real intersection of the rotated data plane with the box: a polygon with 3–6 corners, hidden when the plane misses the box. This applies to the dataset, user, layer and task bounding boxes. Unrotated, the result is exactly the old rectangle. (Noticed by Philipp on #10355.)

- `viewer/geometries/helpers/box_cross_section.ts`: pure `getBoxCrossSection` with unit tests. The fills from #10355 can reuse its corners as a triangle fan.
- `Cube` now also reacts to rotation changes and draws the polygon into a preallocated line buffer.

Same box, view rotated by (25°, 30°, 15°):

| Before | After |
| --- | --- |
| ![before](https://github.com/user-attachments/assets/0ee898ef-715d-4718-8aad-bb24faa66f0b) | ![after](https://github.com/user-attachments/assets/cb18a68d-3f0a-468d-8a1b-2e753b270ad6) |

### Steps to test:
- Open an annotation with a user bounding box and rotate the viewport: the outline in each 2D viewport is a closed, fully visible polygon matching where the slice cuts the box (compare with the box in the 3D viewport).
- Move along the slice normal until the slice leaves the box: the outline disappears.
- Without rotation, bounding boxes look as before.

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `881ad1a635cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.