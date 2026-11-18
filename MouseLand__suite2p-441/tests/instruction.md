# Issue

**Title:** Include MacOS in travis build.

## Description

PR addresses #438 and #440:  

- Travis now builds for macOS and runs tests. The macOS build is much slower than the Linux build but builds are made in parallel. Travis responses should take a few minutes more than usual. 
- Verifies that `suite2p` works fine on macOS with version 1.4.1 of `scanimage-tiff-reader`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2984fe13095`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.