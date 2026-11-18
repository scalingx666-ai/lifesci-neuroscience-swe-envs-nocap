# Issue

**Title:** ENH: Upgrade VTK from v8.1.1 to v9.6.0 and modernize build

## Description

- Bump VTK superbuild tag to v9.6.0
- Remove obsolete CMake options (TCL wrapping, Qt4/GUI support, VTK_USE_PARALLEL)
- Replace deprecated VTK_USE_FILE with vtk_module_autoinit() for object factory registration
- Modernize find_package(VTK) to use VTK 9 component names without vtk prefix
- Remove deprecated vtkGraphicsFactory usage in antsSurf and GetMeshAndTopology
- Use vtkRenderWindow::SetOffScreenRendering() for offscreen rendering in GetMeshAndTopology
- Cast float to int for vtkWindowToImageFilter::SetScale() in antsVol
- Fix vnl_matrix_fixed to vnl_matrix conversion in WarpVTKPolyDataMultiTransform
- Fix crash bug in BinaryImageToMeshFilter: convert raw VTK pointers to vtkSmartPointer and initialize previously uninitialized members that were deleted in destructor
- Add find_package(OpenSSL) before libzip for TractographyTRX ITK target imports


# Description

Old VTK no longer builds on modern systems, update the build and code.

This was executed by **Claude Code using Opus 4.6 maximum effort**, with planning then execution.

# Testing

There were no existing tests for the VTK functionality. I'm happy to manually do some testing if anyone has suggestions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87d35de2e361`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.