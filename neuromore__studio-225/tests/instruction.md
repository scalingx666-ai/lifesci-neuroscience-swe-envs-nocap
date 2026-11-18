# Issue

**Title:** Several small improvements

## Description

* Build Studio on macOS with Objective C++ support enabled (e.g. to be able to call Cocoa directly)
* Add CPU detection and according macros (e.g. `NEUROMORE_CPU_X64`) to `Engine/Core/Config.h`
* Add some string constants used for platforms and cpu to `Engine/Core/Config.h`
* Add `7za.exe` prebuilt zip utility to `./dist/win-10/` for windows packaging

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06d8ffd0ca61`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.