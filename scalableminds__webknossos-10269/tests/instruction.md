# Issue

**Title:** Collapse layer bounding boxes earlier and remove empty gap in bounding box tab

## Description

### Summary
- The "Layer Bounding Boxes" section now auto-collapses once there are 5 user bounding boxes (previously 10).
- Removed the empty strip between the user bounding box list and the layer section. The table still reserved 40px for an "add" button that has since moved to the toolbar; it now keeps only a 2px slack to avoid the AutoSizer re-render/scrollbar loop.

### Steps to test:
- Open an annotation with ≥5 user bounding boxes → layer section is collapsed by default; toggling it still works.
- Add enough bounding boxes to make the list scroll → the last row scrolls up to the layer section divider without a gap, and no extra scrollbar flickers.

------
- [x] Added changelog entry
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c5c8ee75a14d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.