# Issue

**Title:** [FIX] improve matlab demos and setup

## Description

- [x] tested on Linux (Ubuntu 18.04, Matlab 2017a)
- [x] tested on Windows (Windows 10, Matlab 2021a)
---
- [x] fix and refactor data download in demos to make it work on different OS
- [x] update gitignores to ignore examples outputs
- [x] improve setup and adapt README accordingly
  - [x] `fracridge` added as a submodule to avoid users having to install it manually and to "lock" of this required dependency
  - [x] fail early: thow error in  `setup` if `fracridge` is not found in the path
  - [x] only add the required folders to the path
  - [x] use setup script in examples

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9326eefb57a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.