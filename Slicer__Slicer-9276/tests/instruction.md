# Issue

**Title:** macOS arm64 packaging name fixes

## Description

This updates the generated packaged installer name to end in "-macosx-arm64.dmg" for arm64 builds instead of "-macosx-amd64.dmg". The `Slicer_ARCHITECTURE` variable gets set correctly now to handle this.

Due to the above change it was also needed to define the CTKAppLauncher to continue to be the amd64 version as that is all that is available. Work to track a native arm64 launcher is defined in  We similarly already define the Windows build to always use an i386 32-bit build as an amd64 Windows version is not available.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `143b942237aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.