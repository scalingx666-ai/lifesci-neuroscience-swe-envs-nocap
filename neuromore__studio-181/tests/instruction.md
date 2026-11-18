# Issue

**Title:** Fix OSX ARM64

## Description

* Fixes ARM64 build on OSX by back-porting the according Qt changes from later 5.12.10
* Enables LIPO (univeral-binary) creation in `make dist`
* Runs OSX Github builds for X64 and ARM64 in parallel

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `969e0f21df30`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.