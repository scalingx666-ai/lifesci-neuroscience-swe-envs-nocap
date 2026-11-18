# Issue

**Title:** COMP: Update GUI source files for VTK9, Qt5, and ITK5 API compatibility

## Description

## Summary

Fixes compilation errors in `DebugImageViewer` and `BRAINSConstellationDetectorGUI`
when building against VTK 9, Qt5, and ITK 5.4. This PR contains only C++ source
changes; the accompanying CMake/build configuration changes are tracked separately.

### VTK9 API changes
- `QVTKWidget` → `QVTKOpenGLNativeWidget`; construct with `vtkGenericOpenGLRenderWindow`
  and `setRenderWindow()` (Qt5/VTK9 camelCase convention)
- `GetRenderWindow()`/`GetInteractor()` → `renderWindow()`/`interactor()`
- `vtkTypeRevisionMacro`/`vtkCxxRevisionMacro` removed; replaced by `vtkTypeMacro`
- `vtkImageViewer2::SetInput` → `SetInputData`
- `vtkMatrix4x4::operator[]` removed; use `GetElement(row, col)`
- Added `class vtkImageData;` forward declaration in `QImageViewerWidget.h`

### ITK5 API changes
- Pixel type enums scoped: `itk::ImageIOBase::IOComponentEnum::UCHAR` (etc.)
- `SpatialOrientationEnums` values moved to `ValidCoordinateOrientations` scope
- `itk::AnatomicalOrientation` has no default constructor in ITK 5.4; initialize
  with `PositiveEnum::LPS` before raw socket read overwrites the bytes
- Added missing `#include "itkAnatomicalOrientation.h"` in `DebugImageViewer/DebugImageViewerClient.h`
- Fixed `OrientImage()` in both `DebugImageViewerClient.h` copies: negate the direction
  matrix before `SpatialOrientationAdapter::FromDirectionCosines` — the `GetAsDirection()`
  method uses a positive-axis convention while `SpatialOrientationAdapter` uses the
  origin-corner (opposite sign) convention
- Fixed typo `itk::itkAnatomicalOrientation` → `itk::AnatomicalOrientation`

## Files changed
- `BRAINSCommonLib/DebugImageViewerClient.h`
- `BRAINSConstellationDetector/gui/BRAINSConstellationDetectorGUI.cxx`
- `BRAINSConstellationDetector/gui/QSliceViewer.cxx`
- `BRAINSConstellationDetector/gui/QVTKInteractionCallback.cxx`
- `BRAINSConstellationDetector/gui/include/QSliceViewer.h`
- `DebugImageViewer/DebugImageViewerClient.h`
- `DebugImageViewer/QDebugImageViewerWindow.cxx`
- `DebugImageViewer/QImageDisplay.cxx`
- `DebugImageViewer/QImageViewerWidget.cxx`
- `DebugImageViewer/QImageViewerWidget.h`
- `DebugImageViewer/vtkKWImage.cxx`
- `DebugImageViewer/vtkKWImage.h`

## Test plan
- [ ] Build `DebugImageViewer` target with VTK 9 + Qt5 — no compile errors
- [ ] Build `BRAINSConstellationDetectorGUI` target — no compile errors
- [ ] Verify `DebugImageViewer` executable launches without crash (requires display)
- [ ] Verify `BRAINSConstellationDetectorGUI` executable launches without crash

## AI contribution
This PR was produced with assistance from Claude Sonnet 4.6. All changes were
reviewed and verified to compile cleanly in both Release and Debug inner builds.
The `OrientImage` sign-convention fix was validated against the pattern in `itkIO.h`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6d64b21ca55`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.