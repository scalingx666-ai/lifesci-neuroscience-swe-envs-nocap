# Issue

**Title:** COMP: Give the SuperBuild OpenJPEG an absolute install name on macOS (consistency)

## Description

## What this is

A **consistency/robustness** change — **not a fix for a functional bug**. Nothing is broken today; this makes the SuperBuild OpenJPEG behave like every other SuperBuild library.

Slicer forces `CMAKE_MACOSX_RPATH` off for all external projects (`UseSlicer.cmake.in`). OpenJPEG — unlike ITK, VTK and DCMTK — sets no install-name directory of its own, so `libopenjp2` is the **one** SuperBuild library installed with a **bare** `LC_ID_DYLIB` (`libopenjp2.7.dylib`, no directory). Consumers that link it — DCMTK's `dcmjp2kcs` JPEG 2000 codec and ITK's GDCM (built against this same OpenJPEG) — record that bare name.

## Why it isn't a bug in practice

A bare install name still resolves in every real path:
- **Launcher-based use** (the app, `PythonSlicer`, CLI modules launched by Slicer): the launcher adds the OpenJPEG lib directory to the library path.
- **Packaged app**: the macOS bundle fixup — CPack's `BundleUtilities` for factory builds, or Slicer's own packager — copies `libopenjp2` into the bundle and rewrites the dependents' references at packaging time.

So both the shipped product and normal development already work. (This surfaced during off-machine packaging development, where the custom packager initially didn't resolve a bare name; that path now handles it too.)

## Why do it anyway

- The recorded dependency becomes **self-describing and relocatable** without relying on the launcher environment or on the packager having to resolve a bare name — the packager's bare-name special case can then be dropped.
- OpenJPEG stops being an install-name **outlier**, removing a latent footgun for future packaging/tooling.

## Fix

Set `CMAKE_INSTALL_NAME_DIR` to the install `lib` directory so the installed `libopenjp2` gets an absolute install name, matching ITK/VTK/DCMTK. One line plus an explanatory comment in `SuperBuild/External_OpenJPEG.cmake`.

## Verification

A standalone OpenJPEG v2.5.4 build with these flags (`-DCMAKE_MACOSX_RPATH=0 -DCMAKE_INSTALL_NAME_DIR=<install>/lib`) installs the dylib with an absolute id:

```
LC_ID_DYLIB: <install>/lib/libopenjp2.7.dylib     (was: libopenjp2.7.dylib)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cecaf6792162`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.