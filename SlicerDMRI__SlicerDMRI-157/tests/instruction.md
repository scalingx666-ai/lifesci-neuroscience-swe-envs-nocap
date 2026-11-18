# Issue

**Title:** COMP: Fix build error with C++17

## Description

Fixes build error "no member named 'random_shuffle' in namespace 'std'"
(https://slicer.cdash.org/viewBuildError.php?buildid=2735613)

The error is due to `random_shuffle` was deprecated in C++14 and removed in C++17.
The replacement `shuffle` function takes a random generator as parameter.
More details: https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n4190.htm

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bbc13dce6ae8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.