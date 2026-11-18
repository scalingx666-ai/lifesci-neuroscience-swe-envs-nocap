# Issue

**Title:** Update CI

## Description

* Disable `windows-2019` Builds
* Disable `macos-11` Builds
* Disable Android Builds on `macos-12`
* Don't upgrade Ubuntu anymore as part of the CI steps (fix latest CI error on Ubuntu 20.04)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f83d31a3a27a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.