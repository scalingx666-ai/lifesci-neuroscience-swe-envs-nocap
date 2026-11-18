# Issue

**Title:** Highlight the hovered segment's mesh in 3D when hovering in 2D views

## Description

### Summary
When hovering over a segment in one of the 2D viewports, its mesh (if loaded) is now highlighted in the 3D viewport, mirroring the existing 3D → 2D hover highlighting. This covers the segment level only; supervoxel-level highlighting for proofreading will follow separately.

- Disabled in proofreading mode (highlighting the whole agglomerate would hide the active-supervoxel highlight).
- Mesh chunks that load while their segment is hovered (streamed ad-hoc chunks, new LODs, reloaded meshes) are highlighted as well.
- Hovering a segment in the segments list also highlights its mesh, since it sets the same hovered segment id.

### Steps to test:
- Open a dataset with a segmentation layer and load a few meshes (outside the proofreading tool).
- Hover over a segment with a loaded mesh in the XY/YZ/XZ viewport → its mesh is highlighted in the 3D viewport; moving away removes the highlight.
- Hover a mesh in the 3D viewport → behaves as before.
- Hover a segment in the segments list → its mesh is highlighted, also right after hovering in the 3D viewport.
- Hover a segment in 2D while its ad-hoc mesh is still loading → the newly loaded chunks are highlighted, too.
- Hover a segment in 2D, remove its mesh via the context menu, then hover another segment → no errors.
- Switch to the proofreading tool → hovering in 2D no longer highlights whole meshes.

### Issues:
- contributes to #10125

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a425ab9e8b9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.