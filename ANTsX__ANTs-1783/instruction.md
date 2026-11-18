# Issue

**Title:** ENH: CI updates

## Description

* Replace Centos7 with AlmaLinux 8
* Remove macos-11 build (runner removed by Github)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `085a078d55c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.