# Issue

**Title:** Fencing memmem implementation based on OS, not compiler

## Description

I don't know the Windows platform well, but my AppVeyor builds for `divest` are failing using the latest release of `dcm2niix`, due to missingness of `memmem`. Since the presence of this function is presumably a question of system headers rather than compiler environment, it seems like fencing the inline `memmem` implementation for Windows, rather than Visual Studio specifically, might be a more general solution. Indeed, `divest` seems to build properly on Windows like this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d0c173080bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.