# Issue

**Title:** Win10 Package Fixes | Tweaks

## Description

**Changes**

* Sets Visual Studio projects to `CXX17` (same as in Make)
* Replace Qt `mkpath()` calls (buggy in restricted Win10 App) with `std::filesystem::create_directories()` (fixes non-persistence issue on Win10 app install)
* Add some basic `DeviceCapability` settings for Serial and USB to `.appxmanifest` of Studio

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `452aab42ddb8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.