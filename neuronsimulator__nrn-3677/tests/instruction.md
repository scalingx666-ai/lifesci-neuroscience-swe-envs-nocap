# Issue

**Title:** Fix backward integration

## Description

For some reason, backward integration is completely broken, and keeps reliably segfaulting. While this PR probably does not provide the most elegant fix, I can confirm that it actually fixes the problem, i.e. I can get a usable stack trace when using `nmodl ... blame --line <N>`.

**NOTE**: for future reference, you need ``libdw-dev`` and ``binutils-dev`` on Debian/Ubuntu, and ``libdwarf-devel``, ``elfutils-devel``, and ``libunwind-devel`` on Fedora/other RedHat distros for this to work properly. Backward has clunky CMake integration so even if you don't have _any_ of these libraries installed, the CMake config will happily continue, and you'll get a segfault when using the blame feature.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76621adfb04a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.