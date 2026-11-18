# Issue

**Title:** COMP: Fix extension configure error caused by missing qRestAPI use file

## Description

Since 124d70f408 (ENH: Adapt qRestAPI consumption to the modernized CMake package), qRestAPI exports an imported target and no longer provides a UseqRestAPI.cmake, so qRestAPI_USE_FILE is undefined.

UseSlicer.cmake still iterates over Slicer_EXTERNAL_PROJECTS and calls include(${<proj>_USE_FILE}) for every project not listed in Slicer_EXTERNAL_PROJECTS_NO_USEFILE. For qRestAPI this expanded to an argument-less include(), so every extension failed to configure:

```
  CMake Error at Slicer-build/UseSlicer.cmake:140 (include):
    include called with wrong number of arguments.  include() only takes one
    file.
```

Add qRestAPI to the no-use-file list so extensions configure again. Slicer's own build does not include UseSlicer.cmake and is unaffected.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19560e138b38`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.