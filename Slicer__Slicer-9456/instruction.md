# Issue

**Title:** BUG: Fix picking of segments shown as binary labelmap when they are clipped

## Description

## Problem

When a segmentation is shown in 3D as binary labelmap (`vtkSegmentationLabelmapSurfaceMapper`) and it is clipped, picking it with `vtkMRMLAccuratePicker` does not hit what is rendered. For example, control points of a line markup are placed inside the segment instead of on its visible surface, or instead of on the cap where a slice plane cuts it.

There are two causes:

- `vtkSegmentationLabelmapSurfaceMapper::IntersectWithRay` ignored the mapper's clipping planes.
- `vtkCellPicker` clips the pick ray with the mapper's clipping planes before it intersects the prop, and it assumes the kept region is where *all* plane functions are positive. The mapper also has `KeepWhereAnyClippingPlaneKeeps`, which the segmentations displayable manager uses for the `ClipIntersection` clip type. With that clip type, the pick skipped the front of the visible segment. It could also drop the prop entirely when a single plane clipped the whole ray, although the mapper still renders part of it.

Example scene (the `ClipIntersection` type, with the Red and Green slice planes): at the middle of the 3D view, the picker hit 650.4 mm from the camera, while the visible surface (the cap on the Red slice plane, as read from the depth buffer) was at 629.7 mm.

## Change

- **`vtkMRMLRayCastMapper::IntersectWithRay`** now gets the prop's model-to-world matrix. The documented contract is that the mapper applies its own clipping, as it does when rendering: what the planes clip away is not hit, and caps it draws where the planes cut are hit.
- **`vtkMRMLAccuratePicker`** overrides `IntersectWithLine`, so that a ray-cast mapper gets the whole pick ray (t from 0 to 1) and the prop's matrix, instead of the ray pre-clipped by `vtkCellPicker`. Other props are picked as before.
- **`vtkSegmentationLabelmapSurfaceMapper::IntersectWithRay`** clips the ray the way the shader does (`compositeKeptPart`):
  - The kept parts of the ray, front to back, are one interval in the keep-where-all mode, and up to two (before and after the clipped interval) in the keep-where-any mode.
  - In each part it hits, in order: the cap at the part's start, if it starts on a plane inside a segment and caps are shown (`CapClippedSurface`, `CapOpacity` > 0); otherwise the first crossing of the segment surface, in either direction; otherwise the cap at the part's end.

`IntersectWithRay` was added recently and this mapper is its only implementation, so its signature changes.

## Testing

- **`vtkMRMLAccuratePickerTest`:** a new check that a ray-cast mapper is asked for the whole ray, with the prop's matrix, when `vtkCellPicker` would have clipped all of it, and that the prop is still picked.
- **Exact geometry**, tested in a WebAssembly build of Slicer with this change (SlicerWeb, with SwiftShader): a sphere segment of radius 30 mm clipped by two planes, on a 9×9 grid of rays, in all four combinations of keep-where-all / keep-where-any and caps on / off. On every ray that should hit (81, 81, 36 and 27 rays), the picker lands within 1.5 mm of the first visible point computed from the sphere and the planes, as does the depth buffer of the rendering. Rays that should hit nothing pick nothing.
- **The example scene:** the picker now hits the visible cap (629.7 mm), the same point as the depth buffer, and a line markup's control points are placed on the visible surface. On a 7×7 grid of rays, the picker agrees with the depth buffer within 1.5 mm in the `ClipIntersection` type, with and without caps, and without clipping. In the `ClipUnion` type it agrees on most rays. On the rest, the CPU surface (voxel boundaries at the 0.5 level) and the GPU surface (smoothed distance field) differ in this 73-segment segmentation, independently of clipping.
- I couldn't build Slicer on the desktop for this change, so `vtkMRMLAccuratePickerTest` hasn't been run; CI will run it.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2963892cde1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.