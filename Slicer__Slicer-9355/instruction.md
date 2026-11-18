# Issue

**Title:** ENH: Optimize interaction handle rendering with vtkGlyph3DMapper

## Description

Replace the per-representation vtkAppendPolyData / vtkTransformPolyDataFilter CPU pipeline with a single shared vtkGlyph3DMapper per representation that batches all handle glyphs (rotation, translation, scale) into one GPU instanced draw call, using per-instance orientation/scale/color arrays instead of composing handle polydata by hand on the CPU every frame.

Previously the full handle polydata pipeline (append + transform filter) was rebuilt on every render call, even when nothing about the handles had actually changed - e.g. camera clipping-range updates alone were enough to trigger MTime propagation and force a full rebuild. Add a RenderState struct that caches the camera pose, slice transform MTime, and active component, and only rebuilds the instance arrays when that state actually changes.

Benchmark: 80 vtkMRMLMarkupsROINode instances with HandlesInteractive enabled simultaneously in the 3D view (~1200 handle actors total), orbiting the camera for 100 Render() calls x 2 runs, identical window size (1384x835), RelWithDebInfo build, before/after this commit:

| | main (before) | branch (after) | speedup |
| --- | ---  | --- | --- |
| avg | 568 ms/frame | 76 ms/frame | ~7.5x |
| median | 557 ms/frame | 71 ms/frame | ~7.8x |
| min | 503 ms/frame | 62 ms/frame | ~8.1x |
| frame rate | ~1.8 fps | ~13 fps | ~7.2x  |

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `583e9b37d50e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.