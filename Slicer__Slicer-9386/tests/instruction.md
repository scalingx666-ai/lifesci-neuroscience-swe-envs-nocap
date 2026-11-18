# Issue

**Title:** BUG: Fix Windows installer file associations and unsafe uninstall

## Description

## Problem

Commit 5b5ae87dd2 ("ENH: Use applicationDisplayName in user facing text") removed the initialization of `APPLICATION_NAME` in `SlicerCPack.cmake` while the NSIS file association commands kept referencing it. Since the variable expanded to an empty string in every package built from 3D Slicer 5.9.0-2025-09-18 up to 5.13.0-2026-09-04 (including stable releases 5.10.0 to 5.12.3):

- the installer wrote the open command to `SOFTWARE\Classes\shell\open\command` instead of `SOFTWARE\Classes\Slicer\shell\open\command` and associated `.mrml`, `.mrb` and `.xcat` with an empty ProgID;
- the uninstaller ran `DeleteRegKey SHCTX "SOFTWARE\Classes\"`, recursively deleting the file associations of all applications of the current user (see ).

## Changes

**Commit 1: BUG: Fix Windows installer file associations and unsafe uninstall**

- Restores the `APPLICATION_NAME` initialization.
- Adds a CMake configure-time `FATAL_ERROR` if the application name is empty.
- Emits the ProgID as an NSIS constant (`SLICER_FILE_ASSOCIATION_PROGID`) guarded by `!if`/`!error`, so an empty name aborts the NSIS compilation instead of producing an installer that deletes the parent key.
- Writes the ProgID key once instead of once per extension, and uses the application display name for the user-facing file type description ("3D Slicer supported file").

**Commit 2: ENH: Add Slicer Uninstall Guard registry key in Windows installer**

- Adds `CMake/SlicerUninstallGuard.ps1`, which creates `HKCU\Software\Classes\!SlicerUninstallGuard`, denies its deletion to everyone, and verifies that the key cannot be deleted. Registry key deletion stops at the first error, so this key (which sorts before all others) stops the uninstallers of affected releases before they can do damage (see ).
- The installer extracts the script into its temporary plugins directory and runs it with the bundled `nsExec` plugin, so no console window is shown and nothing is left in the install tree. The key is intentionally not removed by the uninstaller, since it protects against uninstallers of older installations.

## Testing

- Reconfigured and rebuilt the NSIS package on Windows 11. The generated `project.nsi` contains `SOFTWARE\Classes\${SLICER_FILE_ASSOCIATION_PROGID}` for the ProgID key, open command and uninstall, and each extension maps to the ProgID.
- Verified with makensis that an empty `SLICER_FILE_ASSOCIATION_PROGID` aborts compilation with the `!error` message, and that a non-empty one produces `SOFTWARE\Classes\Slicer` paths.
- Ran `SlicerUninstallGuard.ps1` against a temporary key name: the Deny-Delete ACE was added, a plain delete was refused, and a second run reported the guard as already present. On a machine where the guard already exists, the script reports "already present" and leaves the key untouched.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19282f9a8d7b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.