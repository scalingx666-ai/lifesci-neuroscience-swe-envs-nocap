# Issue

**Title:** Split VIEWPORT_WIDTH constant by its roles

## Description

### Summary
. `VIEWPORT_WIDTH` (376) was used for four unrelated things. This PR splits it by role, so the constant disappears. No behavior change is intended.

- **Ortho planes:** the plane geometry now has a width of 1, so its scale is simply the viewport extent in the dataset unit (`getPlaneScalingFactor` is gone). `PLANE_WIDTH` in the data shader is removed. The crosshair gap, which was hardcoded in geometry units, is now relative to the plane width.
- **3D view panning:** the `VIEWPORT_WIDTH` factors cancelled each other out. `moveTDViewXAction`/`moveTDViewYAction` and `getViewportScale` are replaced by `moveTDViewByPixelDeltaAction`.
- **Default viewport size:** `DEFAULT_VIEWPORT_SIZE_IN_PX` (still 376) is used until the viewports are measured.
- **Flight mode:** `FLIGHT_PLANE_WIDTH` (still 376). Here the value matters: it defines how many voxels are visible at zoom step 1. The spherical cap radius, flight clipping distance and camera near/far are relative to it, so changing it would need a settings migration.

Also corrects two comments from #10407: the flycam's local coordinates are multiples of the smallest voxel extent, not "pixels at zoom step 1".

### Steps to test:
- Ortho viewports: rendering, zooming and the crosshair (incl. the gap in the middle) look as before, also for rotated viewports.
- 3D viewport: panning with the mouse follows the cursor as before.
- Flight/oblique mode: rendering and zoom unchanged.

### Issues:
- contributes to #9131

------
- [x] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4fbe144de6fb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.