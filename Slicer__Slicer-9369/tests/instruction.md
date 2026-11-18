# Issue

**Title:** COMP: Fix python DLL placement next to the app on single-config generators

## Description

## Problem

The POST_BUILD step added for issue #1180 copies the Python DLL next to the application executable so the app can start. Its destination is:

```cmake
# CMake/SlicerMacroBuildApplication.cmake
COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${PYTHON_LIBRARY_PATH}/${_python_library_name_we}.dll
        ${_slicerapp_output_dir}/$<CONFIG>
```

`$<CONFIG>` expands under every generator, but only **multi-config** generators place the executable in a per-configuration subdirectory of `RUNTIME_OUTPUT_DIRECTORY`. `_slicerapp_output_dir` is read straight from that property:

```cmake
get_target_property(_slicerapp_output_dir ${slicerapp_target} RUNTIME_OUTPUT_DIRECTORY)
```

so on a single-config generator (Ninja, NMake) the executable sits directly in `_slicerapp_output_dir` and the copy targets a `Release` path that does not exist. The block is guarded only by `WIN32` and `Slicer_USE_PYTHONQT`; `_isMultiConfig` is never computed in this file.

## Why this is easy to miss

It does not fail the build. `cmake -E copy_if_different <src> <dir>/Release` where `Release` does not exist creates a **file** named `Release` containing the DLL bytes and exits 0:

```
$ cmake -E copy_if_different python312.dll out/Release ; echo "exit=$?"
exit=0
$ ls -la out/
-rw-r--r-- 1 ... 9 Release        # a file, not a directory
```

So the build stays green while the hack silently stops doing its job, leaving the application without the Python DLL beside it at runtime — exactly the condition issue #1180 exists to prevent.

Note the neighbouring `SLICERAPP_EXECUTABLE` definition builds its path from the same variable with **no** `$<CONFIG>` component, so the two lines already disagree about the layout:

```cmake
set(SLICERAPP_EXECUTABLE "${_slicerapp_output_dir}/${_slicerapp_build_subdir}${executable_name}${CMAKE_EXECUTABLE_SUFFIX}")
```

Confirmed against a Ninja build, where the app resolves to `Slicer-build/bin/SlicerApp-real.exe` — i.e. directly in `_slicerapp_output_dir`.

## Change

Use `$<TARGET_FILE_DIR:${slicerapp_target}>`, which is the directory holding the executable under both generator classes and is exactly what the surrounding comment describes. No behaviour change for Visual Studio builds, where it resolves to the same per-configuration directory the hardcoded path produced.

Reported alongside #9367 and #9368, both Windows + Ninja build issues found in the same sweep; the three are independent and can be taken in any order.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `583e9b37d50e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.