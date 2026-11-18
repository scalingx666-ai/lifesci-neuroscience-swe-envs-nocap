# Issue

**Title:** Collect standalone build dependencies during compilation on POSIX

## Description

Related to #1825.

This replaces the separate whole-project `-MM` pass with per-object dependency files generated during compilation on Linux and macOS.

It also fixes a dependency-target mismatch: the existing output can refer to `foo.o` when the actual target is `code_objects/foo.o`, which can cause header changes to be missed.

The patch records the correct object target, rebuilds objects whose dependency files are missing, and registers generated dependency files for cleanup through `code_files_to_delete()`. Leftover `.c` source handling has been removed; additional sources must use the documented `.cpp` extension. The incremental-build tests are C++-only and run in standalone mode. Windows/MinGW retains its existing dependency-generation path, and the MSVC Makefile template is unchanged.

The dependency and source-handling update was validated locally on macOS/Apple Clang: 35 passed, with one existing Apple Silicon skip. Earlier Linux/GCC validation included nine portable build-contract checks using a host-generated fixture. Seeded baseline and patched builds produced byte-identical outputs, including a four-thread OpenMP smoke test on Linux. These are local results, not results from the latest CI run.

In four alternating build pairs per model on Apple Clang, median compilation time changed from:

- 8.69 to 6.71 seconds for a 13-file model;
- 76.66 to 62.46 seconds for a 94-file model.

These are earlier local measurements; OS caches and background activity were not controlled. Native MinGW and CUDA builds have not been tested locally.

Would you be happy to take this as a small POSIX-only first step, with PCH handled separately?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ecd72a361f54`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.