# Issue

**Title:** BUG: Keep the install-tree lib layout in the macOS bundle for extensions

## Description

## Problem

The macOS bundle closer introduced in c3467ecd3f (`SlicerBundleCloseDeps.py`) embedded every external dylib **flat into `Contents/lib`** and derived each install name from that flat location (`@rpath/lib/<name>`). The core application worked because all of its own binaries were rewritten to the flat names consistently — but **compiled C++ extensions could not load**:

```
Cannot load library .../Extensions-34898/SlicerVMTK/lib/Slicer-5.13/qt-loadable-modules/libqSlicerBranchClipperModule.dylib:
  Library not loaded: @rpath/lib/Slicer-5.13/libitkAdaptiveDenoising-5.4.1.dylib
```

Extensions are built by the factory against the standard install tree, where core libraries live in the versioned lib dir and are referenced as `@rpath/lib/Slicer-<ver>/<name>` (and the Python runtime as `@rpath/lib/Python/lib/libpython…`). dyld binds an extension's dependency to the already-loaded core library only when the install name matches exactly, so flattening renamed those libraries and broke every compiled extension (SlicerVMTK, ExtraMarkups, …).

## Fix

Restore the historical BundleUtilities layout the extension ABI depends on:

- ordinary dylibs → the versioned Slicer lib dir (passed from CMake as `--lib-subdir "@Slicer_LIB_DIR@"`, e.g. `lib/Slicer-5.13`)
- the Python runtime → `lib/Python/lib`
- frameworks → `Frameworks` (unchanged)

The `@rpath` install name is derived from the embedded location, so fixing the location restores the names. This also returns OpenSSL to `lib/Slicer-<ver>`, which is already on the runtime library path, so it **independently resolves the TLS lookup from #9339** (the `Contents/lib` search-path entry added in #9340 becomes unnecessary, though harmless).

## Verification

Packaged Slicer with the fix and confirmed in the resulting `.dmg`:

- `libitkAdaptiveDenoising-5.4.1.dylib` → `lib/Slicer-5.13/`, id `@rpath/lib/Slicer-5.13/libitkAdaptiveDenoising-5.4.1.dylib`
- `libpython3.12.dylib` → `lib/Python/lib/`, id `@rpath/lib/Python/lib/libpython3.12.dylib`
- `libssl.1.1.dylib` → `lib/Slicer-5.13/`
- bare `Contents/lib/*.dylib` = 0 (was 250); `lib/Slicer-5.13/*.dylib` = 288

Then built **SlicerVMTK** and **ExtraMarkups** factory-style (`Slicer_DIR` → this build, `ExtraMarkups_DIR` → the ExtraMarkups build) against the package, installed both, and loaded every one of their **18 compiled modules with 0 dependency errors** (`dlopen` in-process), plus a clean interactive launch in a vanilla arm64 VM with both extensions installed.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa84163204a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.