# Issue

**Title:** Improve Windows CI

## Description

.

The Windows installer build step is `shell: cmd`, so its exit code is the exit code of the last command. That command was the `find` which writes `build_files.txt`, and `find` succeeds whenever the build directory exists. A failed `win_build_cmake.sh` still left the step green, and the next step waited on the hoc association until the job timeout.

`win_build_cmake.sh` is now the last command of the build step. The manifest `find` is the following step, and it is skipped when the build fails.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5433b1f7c22d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.