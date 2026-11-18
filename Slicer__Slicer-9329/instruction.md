# Issue

**Title:** BUG: Keep 3D picking fast when a large surface is shown

## Description

### Symptom
Picking in a 3D view is janky whenever a large surface is shown — most commonly
a segmentation closed surface. Markup control-point dragging (default snap mode
"to visible surface") and hover read-out both pick on every mouse move; hiding
the surface makes interaction smooth again. A plain `forceRender()` of the same
scene is fast (~12 ms), so the cost is in picking, not rendering.

### Cause
`vtkCellPicker` tests **every cell of every pickable surface** unless a spatial
locator is registered for that surface's data. Over a segmentation closed
surface with millions of cells each pick costs tens to hundreds of milliseconds
(measured ~184 ms over a 2.4 M-cell surface; a warmed pick is as slow as the
first, confirming it is brute force, not a one-time build).

### Fix
Add **`vtkMRMLAccuratePicker`** (a `vtkCellPicker` subclass) that registers and
caches a `vtkStaticCellLocator` for each large, pickable surface in the renderer
before every pick — rebuilding a locator only when its surface changes and
dropping it when the surface is hidden. Picks become indexed queries; tolerance,
picked position, and returned normal are unchanged.

Following review feedback, this is **shared per view rather than per widget**:
`vtkMRMLThreeDViewInteractorStyle` now creates a `vtkMRMLAccuratePicker` as the
picker it already hands to `vtkMRMLInteractionEventData`, so every widget — and
anything that needs quick localization in world coordinates — reuses one picker
and one set of locators. This also accelerates the interaction-context / hover
pick (`ComputeAccurateWorldPosition`), not just markups. The markups widget
passes the shared picker to its representation for each interaction event, so
control-point dragging uses it too.

| | before | after |
|---|---|---|
| pick over a 2.4 M-cell surface | ~184 ms | ~0.03 ms |
| scripted control-point drag over the surface | ~184 ms/move | ~0.4 ms/move |

The only residual cost is a one-time locator build (~50 ms for a multi-million
cell surface) on the first pick after such a surface appears — a single frame,
then sub-millisecond. Helps any large surface, not only segmentations.

### Test
`vtkMRMLAccuratePickerTest` picks repeatedly over a 1.6 M-cell surface and
asserts the picks stay fast (< 30 ms/pick). It fails (~78 ms/pick) without the
locator and passes (~0.2 ms/pick) with it; the wide gap keeps it insensitive to
hardware speed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb457fc76d1c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.