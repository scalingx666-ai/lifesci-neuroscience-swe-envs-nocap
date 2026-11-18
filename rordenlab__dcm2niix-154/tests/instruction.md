# Issue

**Title:** Avoid using defunct "register" keyword in C++

## Description

The `register` keyword was [deprecated in C++11 and removed in C++17](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2015/n4340), and CRAN now requires C++ code included in R packages not to use it, to avoid problems on their build farm (notably with the upcoming `clang` 6.0). This small PR removes the keyword where it is used in C++ code within `dcm2niix`, and also drops the`clang` flag telling the compiler not to complain about the deprecation (which should no longer be necessary).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a65919427582`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.