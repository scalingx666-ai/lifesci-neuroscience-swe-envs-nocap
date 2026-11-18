# Issue

**Title:** BUG: Skip bundled extension CPack install projects on macOS

## Description

On macOS, packaging does not use the raw multi-project CPACK_INSTALL_CMAKE_PROJECTS install mechanism: SlicerCPackBundleFixup's dependency-closure script is the sole mechanism that embeds needed dylibs into the .app bundle. Appending bundled extensions' <extension>_CPACK_INSTALL_CMAKE_PROJECTS entries in this case only installed a stray duplicate copy of extension files beside the bundle instead of into it.

Guard the loop with NOT APPLE, matching the existing behavior already applied to Slicer_ADDITIONAL_PROJECTS/Slicer_ADDITIONAL_DEPENDENCIES entries later in this file.

@lassoan I observed this when bundling SlicerIGSIO into my 3D Slicer custom application and running the macOS .dmg for it. I had observed next to the .app bundle that there was also a "lib" directory beside it containing a "MyCustomAppName-5.13" directory with "libvtkIGSIOCalibration.dylib", "libvtkIGSIOCommon.dylib", "libvtkSequenceIO.dylib", and "libvtkVolumeReconstruction.dylib".

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `891751aef18c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.