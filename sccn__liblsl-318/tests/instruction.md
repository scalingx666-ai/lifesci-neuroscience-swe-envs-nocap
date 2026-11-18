# Issue

**Title:** Pass extra CMake options in the Android workflow

## Description

Fixes how extra CMake options reach `cmake` in `android.yml`.

- The `-DCMAKE_ANDROID_ARCH_ABI=...` line had no trailing `\`, so the next line was run as a separate shell command instead of being passed to `cmake`.
- That next line referenced `matrix.config.cmake_extra`, which no matrix entry defines (actionlint flags it), so it was always empty. Removed.
- The `workflow_dispatch` input `cmakeextra` ("Extra CMake options") was never used anywhere. It's now passed to `cmake`, matching the other workflows.

Verified with a manual run on this branch with `cmakeextra=-DLSL_BUILD_EXAMPLES=OFF`: all 3 ABIs build, and CMake reports `LSL_BUILD_EXAMPLES` under "Manually-specified variables were not used". That warning shows the value reached `cmake`; the option simply doesn't exist in liblsl.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42118f80ff92`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.