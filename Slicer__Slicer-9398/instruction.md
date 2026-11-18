# Issue

**Title:** BUG: Respect symmetric slice cut in scissors outside operations

## Description

## Problem

With the Scissors effect set to **Erase Outside** or **Fill Outside** and the slice cut mode set
to **Symmetric**, the operation ignored the cut depth and modified every slice of the segment
instead of only the slices within the depth.

## Cause

In `qSlicerSegmentEditorScissorsEffectPrivate::updateBrushModel()`, "outside" operations rely
on an `additionalBrushRegion` that covers the side of the cut plane which must stay untouched.
That region was only built inside the block guarded by
`if (sliceCutMode != SliceCutModeSymmetric)`, which also applies the half slice extension that
symmetric mode does not use. Symmetric mode therefore never got a protective region, and the
outside operation extended across the whole modifier labelmap.

## Change

* The half slice extension and the construction of the additional region are separated, so the
  region is also built for symmetric mode.
* Symmetric mode restricts the cut on both sides of the plane, so it contributes two regions
  (below and above the cut), combined with `vtkAppendPolyData`. Positive and negative modes
  still contribute a single region, with the same bounds as before.
* The additional region is skipped in unlimited mode. The previous `switch` had no branch for
  it, so the `vtkCubeSource` kept its default unit bounds and that cube was appended to the
  brush. The cube is one slice-view pixel wide and one slice thick, so I did not see it affect
  a segmentation, but it is confirmed in the brush geometry below.

Only `qSlicerSegmentEditorScissorsEffect.cxx` is modified.

## Testing

Built from `main` (58ec4c1b) on Windows 11, Release, Visual Studio 2022, Qt 5.15.2.

**Reporter's scenario, with MRHead.** A square was painted on three axial slice offsets, then
Scissors, Erase Outside, Rectangle, Symmetric 0 mm was applied on the middle offset. Voxels per
painted slice:

| Slice | Before | After, current `main` | After, this PR |
|---|---|---|---|
| lower offset | 10000 | **0** | **10000** |
| middle offset (cut here) | 10000 | 1591 | 1591 |
| upper offset | 10000 | **0** | **10000** |

Coronal view through the three painted slices:

<img width="1836" height="518" alt="scissors-8396-comparison" src="https://github.com/user-attachments/assets/4517c756-c55d-43d7-8ffa-e968ef5ded58" />

**All slice cut modes.** A scripted check drove the effect with synthetic mouse events
(`slicer.util.clickAndDrag`) on a 40-slice volume and counted the slices changed by each
operation, on current `main` and on this branch:

| Slice cut mode | Operation | `main` | This PR |
|---|---|---|---|
| Symmetric (0 mm) | Erase Outside | 40 / 40 | **1 / 40** |
| Symmetric (0 mm) | Fill Outside | 40 / 40 | **1 / 40** |
| Positive | Erase / Fill Outside | 20 / 40 | 20 / 40 |
| Negative | Erase / Fill Outside | 21 / 40 | 21 / 40 |
| Unlimited | Erase / Fill Outside | 40 / 40 | 40 / 40 |

Symmetric now only changes the current slice, and the other modes behave the same as before.

**Brush geometry.** Using the effect's `setDebugOutputFolder()` hook, I inspected the brush
polydata written for each mode (8 points for the extruded brush, 24 per protective cube):

| Slice cut mode (Erase Outside) | `main` | This PR |
|---|---|---|
| Unlimited | brush + 0.04 × 0.04 × 1.0 mm cube (32 points) | brush only (8 points) |
| Symmetric | brush only (8 points) | brush + slab below + slab above (56 points) |
| Positive | brush + one slab (32 points) | identical |
| Negative | brush + one slab (32 points) | identical |

This shows both the missing protective regions in symmetric mode and the spurious cube in
unlimited mode, and that positive and negative modes produce exactly the same geometry as
before.

There are currently no tests for the Scissors effect. I kept this PR to the fix, but I can add
the scripted check as a test if that would be useful. Since it simulates mouse drags, I was not
sure whether it would be reliable enough for CI.

cc @jamesobutler

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4eafce4f2e3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.