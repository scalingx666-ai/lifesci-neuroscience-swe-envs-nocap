# Issue

**Title:** Allow liblsl compilation with c++14.

## Description

This PR makes two minor changes:

- Add a error message to `static_assert` calls
- replace the singular instance of `std::is_integral_v<T>` with `std::is_integral<T>::value`

These changes do not impact anything else, but make it compatible with C++14 standard.

**Why?**

With this change, I have successfully compiled and tested my Dart api wrapper on `ARMv7` (BELA / BeagleBone black).

SBC/Embedded devices are often running older / restricted hardware, and the BELA runs a variant of Debian 9 (Stretch). This means the compilers are outdated, and the latest available Clang / LLVM is version 7, and the highest C/CPP version available is 14.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de5cb3ff4f28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.