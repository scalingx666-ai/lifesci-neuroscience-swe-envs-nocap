# Issue

**Title:** Fix unsafe narrowing

## Description

Attempting to build on OSX with clang, I only got this error (12 times):

`.../src/Algorithms/AlgorithmCiftiSeparate.cxx:657:28: error: non-constant-expression cannot be narrowed from type 'int64_t' (aka 'long long') to 'int' in initializer list [-Wc++11-narrowing]`

The fix is pretty straightforward and compilation ran to completion.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4fa72f1ebf3a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.