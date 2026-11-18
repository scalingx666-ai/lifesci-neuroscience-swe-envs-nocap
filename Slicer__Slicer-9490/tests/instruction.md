# Issue

**Title:** BUG: Retry detaching the temporary disk image when packaging on macOS

## Description

## Problem

The macOS arm64 nightly (recoil) failed to package on 2026-10-21:

```
CPack Error: Error executing: /usr/bin/hdiutil detach "/Volumes/Slicer-5.13.0-2026-10-20-macosx-arm64"
CPack Error: Error detaching temporary disk image.
```

The system log showed the cause. CPack attaches its temporary disk image, Finder in the logged-in GUI session starts accessing the new volume, and CPack's `hdiutil detach` runs about 0.4 seconds later and fails with EBUSY (`unable to unmount /dev/disk4s2 (status code 0x10)`). The CPack DragNDrop generator runs `detach` only once (in both CMake 3.31.8 and current master), so packaging fails and the volume stays mounted.

This happens on any machine where a user is logged into the GUI, for example a build machine with auto-login or a developer Mac.

## Change

* `CMake/SlicerCPackHdiutil.sh`: wrapper around `/usr/bin/hdiutil`. It retries `detach` up to 10 times, waiting 1, 2, ... 10 seconds between attempts, then falls back to `detach -force`. All other commands are passed through with `exec`.
* `CMake/SlicerCPack.cmake`: sets `CPACK_COMMAND_HDIUTIL` to `/bin/sh <Slicer_CMAKE_DIR>/SlicerCPackHdiutil.sh` unless it is already defined. This follows the existing `CPACK_DMG_FORMAT` pattern. The path is not quoted because CPack writes the value into `CPackConfig.cmake` without escaping, and Slicer already rejects directories with spaces (`PreventDirWithSpaces`).

## Testing (on recoil, macOS 26.7.1, CMake 3.31.8)

| Scenario | Result |
|---|---|
| File on the volume held open for 4 seconds | 3 "Resource busy" retries, then detach succeeds |
| File held open throughout | 10 retries, then forced detach succeeds |
| Minimal CPack DragNDrop project (`ULFO`, with an icon so the image is re-attached) | DMG generated, no volume left mounted; `create`, `attach`, `detach` and `convert` all went through the wrapper |

The full Slicer package has not been built with this change yet. The next recoil nightly will exercise it.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46891eee252d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.