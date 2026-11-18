# Issue

**Title:** Fix Win CI

## Description

* Fix: Win Github Runner running low on disk space on `make dist` by deleting not required contents from the repository.
* Fix: `File is used by another process` and `Permission denied` errors during `make dist` on executable files that just got copied and were presumably accessed by Windows Defender (or similar filesystem monitoring process) by adding a short sleep after the copy.
* Tweak: Replace 7z 32bit utility helper by 64bit version
* Tweak: Fix ignored errors when trying to sign not existent `.exe`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ee166c7da86`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.