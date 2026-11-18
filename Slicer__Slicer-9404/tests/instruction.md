# Issue

**Title:** BUG: Keep 3D picked positions on the surface when using cell locators

## Description

Since #9329, positions picked in 3D views on large surfaces can land in front of the surface instead of on it. This is easy to see with the crosshair: Shift + mouse-move over a segmentation closed surface puts the crosshair slightly above the surface. Slicer 5.12.1 puts it on the surface; 5.12.4 does not, on both macOS and Windows.

## Cause

#9329 makes `vtkMRMLAccuratePicker` register a `vtkStaticCellLocator` for each surface with 10,000 or more cells. With a locator, `vtkCellPicker::IntersectDataSetWithLine()` takes the first cell along the ray that intersects the ray within the pick tolerance. `vtkTriangle::IntersectWithLine()` accepts a ray that crosses the plane of the triangle within the tolerance of the triangle, and returns that crossing point. Over a curved surface, that is often a neighboring triangle in front of the one that the ray hits, so the picked position is in front of the surface.

Smaller surfaces are not indexed. For them, `vtkCellPicker` tests every cell and prefers the cell that the ray passes through, but depending on the order of the cells, it can also keep a cell that the ray misses, so they had the same problem, less often.

## Fix

`vtkMRMLAccuratePicker` overrides `IntersectDataSetWithLine()`. It first searches for a cell that the ray hits, with or without a locator, and uses the pick tolerance only if the ray does not hit the surface (for example, just outside its silhouette). The first search uses 1e-6 times the pick tolerance rather than zero: with zero tolerance, a ray that passes exactly through a shared edge can miss both triangles due to rounding. Data that only has vertices or lines skips the first search, since it cannot be hit without the pick tolerance. Picking stays locator-accelerated, and the picked position no longer depends on whether a surface is indexed.

Commits:

- **BUG: Keep 3D picked positions on the surface when using cell locators**: the fix for indexed surfaces.
- **STYLE: Rename vtkMRMLAccuratePicker::Locators to LocatorsBySurface**: the map of cached locators hid the protected `vtkCellPicker::Locators`.
- **BUG: Keep 3D picked positions on the surface without a cell locator**: the same search for surfaces that are not indexed, so that picking behaves the same for all surfaces.

The last two address the suggestions in the discussion below.

## Testing

- `vtkMRMLAccuratePickerTest` now also picks a 15 × 15 grid of positions on a bumpy surface (80,000 triangles, about 1 unit wide), with and without a locator, and checks that they are on the surface. Before these changes, 197 of 225 positions are off the surface with a locator and 108 of 225 without, by up to 9e-4. After them, none are, in either case (largest distance 2e-16). The existing speed check still passes.
- MRMLDisplayableManager and Markups tests pass.
- The first commit was checked interactively on macOS with a segmentation closed surface: the crosshair is on the surface.

Pick times with the VTK of Slicer 5.12.4 (Apple M5 Max), for a grid of picks over a whole 2000 × 550 view:

| Surface | Without locator (up to 5.12.3) | With locator (5.12.4) | This PR |
|---|---|---|---|
| 124k triangles | 1.7 ms | 8 µs (16 µs on the surface) | 14 µs (15 µs on the surface) |
| 588k triangles | 7.6 ms | 9 µs (26 µs on the surface) | 15 µs (19 µs on the surface) |

Rays that miss the surface can take a second locator search. These times were measured in Python by running a second pick for those rays, which overstates their cost; the slowest pick was under 0.1 ms.

For surfaces that are not indexed (measured with this PR's `vtkMRMLAccuratePicker` against `vtkCellPicker`, in a RelWithDebInfo build), rays that hit the surface cost the same. Rays that cross the surface's bounding box but miss it take a second pass over the cells: the mean time for rays that miss goes from 157 to 307 µs for a 9,800-cell sphere, and from 20 to 36 µs for a 968-cell sphere.

## Backport

This should be backported to 5.12 (labeled `backport:5.x`): #9329 was backported, so 5.12.4 has this issue.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d38aed75ec31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.