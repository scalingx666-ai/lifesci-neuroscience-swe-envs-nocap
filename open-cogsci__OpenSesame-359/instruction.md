# Issue

**Title:** Added CFBundleDocumentTypes to (Info.)plist

## Description

This will assign the OpenSesame icon to .opensesame files and open the Opensesame.app when double clicking on an .opensesame file.
The Opensesame.app will only open (and not open the .opensesame file that was double clicked) because the right Apple Events are not yet included in OpenSesame.
The .gz files are handled by other apps by default on OSX, but this change will add the OpenSesame.app to the menu when right clicking a .opensesame.tar.gz file (or in fact any .gz file).
Also updated Usage comment and version.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6fce22b0cfb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.