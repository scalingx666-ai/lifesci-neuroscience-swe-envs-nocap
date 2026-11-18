# Issue

**Title:** Cmake and minmax

## Description

Reduce default buffer size for MacOS.
Fix Windows min/max problem according to @FlorianFranzen. Mirrors his commit: 6b5d9a3 plus changes to cbmex.
Modifed CMakeLists to make building static, mex, oct, test, hdf5 optional.
Make CMakeLists compatible with being an Added Project.
Eliminate warnings in MSVC 2015
Fixed output to dist dir in MSVC.
Copy Qt dlls into testcbsdk dir.
Made -fvisibility=hidden global to all projects. Added some placeholders to fix exports in static lib for Xcode. However, 'unexported' symbols from cbhwlib.h are used by cbmex.
Fixed some Clang warnings in cbsdk and cbmex.

Tested in MSVC 2015 x64 and x32. Tested in MacOS Sierra Xcode and GNU make.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `465c7d8c8a80`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.