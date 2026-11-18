# Issue

**Title:** BUG: Fix extension index build updating LayerDisplayableManager build_subdirectory

## Description

This fixes the following error reported when attempting to build the extensions index:

```
-- Configuring extension: LayerDisplayableManager
CMake Error at SlicerBlockUploadExtension.cmake:23 (message):
  Variable EXTENSION_BUILD_SUBDIRECTORY is not defined !
Call Stack (most recent call first):
  SlicerBlockBuildPackageAndUploadExtensions.cmake:187 (include)
  CMakeLists.txt:63 (include)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1679c12fa90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.