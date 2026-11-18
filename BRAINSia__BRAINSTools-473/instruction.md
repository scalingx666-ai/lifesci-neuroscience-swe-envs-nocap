# Issue

**Title:** COMP: Fix windows compilation adding missing check_avx_flags function

## Description

This commit fixes the following configuration error introduced
in 241ec75 (ENH: Improve setting of -march and -mtune for superbuild):

```
  CMake Error at BRAINSTools/Common.cmake:307 (check_avx_flags):
      Unknown CMake command "check_avx_flags".
    Call Stack (most recent call first):
      BRAINSTools/Common.cmake:351 (check_compiler_optimization_flags)
      BRAINSTools/CMakeLists.txt:86 (include)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b526bd6a4eb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.