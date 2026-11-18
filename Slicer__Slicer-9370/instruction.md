# Issue

**Title:** COMP: Keep the app resource compile off the target's include closure

## Description

## Problem

Building on Windows with the **Ninja** generator aborts while compiling the generated application resource:

```
[1376/2733] Linking CXX shared library bin\qSlicerApp.dll
CreateProcess failed. Command attempted:
"...\cmcldeps.exe RC C:\...\Slicer-build\Applications\SlicerApp\SlicerApp.rc ..."
ninja: fatal: CreateProcess: The parameter is incorrect.
 (is the command line too long?)
```

The `.rc` holds a single line:

```
IDI_ICON1 ICON "Slicer.ico"
```

but CMake expands `<INCLUDES>` into the RC compile from the **target's** include directories (`CMakeRCInformation.cmake`: `<CMAKE_RC_COMPILER> <DEFINES> <INCLUDES> <FLAGS> /fo <OBJECT> <SOURCE>`). For `SlicerApp` that is 764 directories — **45510 characters of `-I` flags in a 47491-character command line**, against the 32767-character limit `CreateProcess` enforces.

## Why the existing guard doesn't cover it

This is the same failure the current `VS_SETTINGS` line was added to prevent:

```cmake
# ... would cause MSB6002 command-line length failures.
set_source_files_properties("${_slicerapp_rc}" PROPERTIES
  VS_SETTINGS "AdditionalIncludeDirectories=${_slicerapp_icon_dir}"
  )
```

`VS_SETTINGS` is honored **only by the Visual Studio generator**, which reads `AdditionalIncludeDirectories` from the vcxproj. Under a single-config generator it is silently ignored, leaving the guard inert — the build fails with ninja's wording (`CreateProcess: The parameter is incorrect`) instead of MSBuild's (`MSB6002`).

Setting the source property `INCLUDE_DIRECTORIES` does **not** fix it either: that property *adds* directories for the source rather than replacing the target's. Measured, the include list grew from 764 entries to 765.

## Change

Compile the resource in a dedicated `OBJECT` library, whose `INCLUDE_DIRECTORIES` **target** property does replace the inherited list, and add its objects to the application. The icon directory is all the resource compile needs, and this behaves identically under every generator.

## Verification

Windows 11, MSVC 19.38.33130 (VS 2022 17.8), CMake 4.4.2, Ninja, Qt 6.11.2.

| | before | after |
|---|---|---|
| `INCLUDES` for the RC compile | 45510 chars (764 dirs) | **69 chars** (1 dir) |
| RC compile statements | 1 | 1 |
| `SlicerApp.rc.res` linked into `SlicerApp-real.exe` | yes | yes |

```
INCLUDES = -I C:\...\Slicer\Applications\SlicerApp\Resources
```

Companion to #9367, #9368 and #9369 — all Windows + Ninja build issues from the same sweep, all independent of one another.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `583e9b37d50e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.