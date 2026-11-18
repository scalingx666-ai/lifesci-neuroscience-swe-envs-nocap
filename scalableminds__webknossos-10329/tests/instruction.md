# Issue

**Title:** Keep the original slice when resizing a single-slice bounding box in YZ/XZ

## Description

### Summary
A box drawn in the XY viewport is one slice deep. In YZ/XZ, its two depth edges are drawn about 1 px apart, so you can't tell which one you grab. Clicking on the line always grabbed the min edge. Dragging it deeper then flipped the box around the max edge, so the box ended up starting one slice later and no longer contained the slice it was drawn in. It also disappeared from the XY viewport.

Now, when the min and max edge of a box's thinnest dimension are at most 5 screen pixels apart, that edge is anchored: while dragging, the box spans its original extent plus the mouse position. Dragging deeper grows the max side, dragging shallower grows the min side, and the box always keeps the slices it already contained, regardless of where the drag started or whether it goes back and forth. Boxes whose edges are visibly apart, and the other dimensions of thin boxes, behave as before.

Trade-off: a box whose thinnest dimension is at most 5 px on screen can't be made thinner by dragging one of its edges inward. Zooming in makes the edges distinguishable again.

| Before (master) | After |
|---|---|
| ![before](https://github.com/user-attachments/assets/c749a440-066e-4215-9104-226e9f344c74) | ![after](https://github.com/user-attachments/assets/7878acf9-60f4-4235-9a97-a62b61722797) |

Box drawn in slice 1024, then the line in YZ is dragged to the right. Before: z = [1025, 1044), the box is hidden in XY. After: z = [1024, 1044).

Video (before, then after):

https://github.com/user-attachments/assets/a95cd4d5-74c8-48af-a178-51ecd983152f

### Steps to test:
- Open an annotation, select the bounding box tool and draw a box in the XY viewport.
- In the YZ viewport, grab the box (a thin line) on or just left of it and drag to the right. The box should grow deeper and still contain the slice you drew it in (it stays visible in XY).
- Do the same dragging to the left. The box should grow shallower and also still contain the original slice.
- Zoom in on a deeper box until both edges are clearly apart; dragging either edge should work as before (including flipping it over the other edge).

### Issues:
- related to #9167 (reported again, the panning from that report is still unreproduced)

------
- [x] Added changelog entry
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cac480d78431`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.