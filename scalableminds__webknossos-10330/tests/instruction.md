# Issue

**Title:** Only resize a bounding box corner when grabbing near the corner of a short edge

## Description

### Summary
Grabbing an edge of a bounding box also grabs a neighbouring edge (resizing the corner) when that neighbour is within the 15 px mouse tolerance. For a box that is short on screen (less than ~30 px, e.g. when zoomed out or for small boxes), that's true almost everywhere along the edge, so a grab anywhere off-centre resized a corner. A drag meant to change only the depth in YZ then also moved the box's top or bottom edge to the mouse height. With a slightly unsteady hand the box could collapse to a few voxels.

Now, along an edge, only its outer quarters count as corner regions (capped at the usual 15 px tolerance). Beyond the end of an edge, the full tolerance still applies, so corners stay easy to grab. For boxes that are longer than 60 px on screen, nothing changes.

| Before (master) | After |
|---|---|
| ![before](https://github.com/user-attachments/assets/9759190c-6ddf-4772-b9ff-0763ff4954d0) | ![after](https://github.com/user-attachments/assets/bdddb5b0-dff7-4e0b-8512-79a231d8340e) |

Box (112 voxels tall, 28 px on screen at this zoom) grabbed in YZ a bit above the middle and dragged to the right, drifting 16 px down. Before: the height collapses from 112 to 8. After: the height stays 112, only z changes.

Video (before, then after):

https://github.com/user-attachments/assets/40f3f31d-fff4-4630-afbd-2892c34669a5

### Steps to test:
- Open an annotation, select the bounding box tool, zoom out and draw a small box in the XY viewport (roughly 30 px tall on screen).
- In YZ, grab the box's line a bit above or below the middle and drag left/right (also slightly up/down). Only the depth should change, not the height.
- Grab a corner of a box (on or just outside it) in any viewport; both edges should still be resized together.

### Issues:
- related to #9167 (the panning from that report is still unreproduced)

------
- [x] Added changelog entry
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37ac8a3a0ea9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.