# Issue

**Title:** Fixes to CMake build system including Qt5 compat. and Matlab fixes.

## Description

Using more conventional folder names.

Need to edit Wiki.
New build instructions are something like...

```
mkdir build
cd build
cmake ..
```

This way it is easy to reset the cmake state by wiping out the build folder. Also, we don't need to keep a list of each possible cmake-generator's output file types in .gitignore

I also modified the relative paths to be relative to `${PROJECT_SOURCE_DIR}`. This way, the CMakeLists.txt contents can be moved around into subfolders, as long as the top level folder has a CMakeLists.txt that defines `PROJECT( CBSDK )`

Almost every open-source project I've worked on uses this structure.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f869e8b279b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.