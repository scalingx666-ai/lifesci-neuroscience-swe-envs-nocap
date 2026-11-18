# Issue

**Title:** PERF: Drop hardcoded VTK base-class imports; rely on pruned wrapping DEPENDS

## Description

Follow-on to #9306 (lazy `vtk` shim). The shim needs each wrapped subclass's VTK
base class imported before the subclass's Python type is built. That was handled
by importing a hand-maintained list of ~28 core `vtkmodules` explicitly in
`slicer/__init__.py`, because at the time the generated wrapping `DEPENDS`
dropped every VTK dependency.

That list is no longer needed. With the corresponding vtkAddon change, each
wrapped module's generated init imports exactly the VTK modules that provide its
direct base classes (the `DEPENDS`, pruned from the full link line to the
base-class providers), so subclasses resolve their bases automatically as the
kits load.

Removing the hardcoded list is strictly better: it is derived from the actual
class hierarchy rather than hand-maintained (and so covers extension modules
that define their own wrapped classes), and it no longer force-loads heavy
modules (`vtkRenderingOpenGL2`, `vtkRenderingVolumeOpenGL2`, `vtkChartsCore`)
that are not base-class providers at startup.

Measured on macOS: 29 of 125 VTK Python modules loaded after a full GUI startup
(none of the rendering/IO/Charts tail), `isinstance(slicer.vtkMRMLScene(),
vtk.vtkObject)` is True, and warm startup drops about 1s (5.9s → 4.9s).

**Depends on** the vtkAddon DEPENDS-pruning change (Slicer/vtkAddon#71). Before
merge this PR must also bump the vtkAddon `GIT_TAG` in `SuperBuild.cmake` to the
merged vtkAddon commit; without the pruned vtkAddon the wrapped modules still
list every VTK module and startup gains nothing. Opened as a draft until then.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d4b0430d803`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.