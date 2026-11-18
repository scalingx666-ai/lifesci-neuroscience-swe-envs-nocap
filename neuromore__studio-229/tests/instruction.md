# Issue

**Title:** Reduce Github Actions GIT LFS traffic

## Description

* Does not run Android CI pipeline on `macos-11` and `windows-2019` anymore
* Does not run iOS CI pipeline on `macos-11` anymore
* Does not create packages on `windows-2019` and `macos-11` anymore
* Updates `download-artifact` action to `v3` in macOS CI pipeline
* Checks out the repository once with GIT LFS in Linux CI and reuse it as artifact

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `41e629c26991`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.