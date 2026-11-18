# Issue

**Title:** Minor refactor of build scripts and removal of unused ones

## Description

Justification:

- the various `.in` files are remnants from the autoconf era, so they are not used anywhere
- `cmake/MPIDynamicHelper.cmake` does not need to call `grep`, CMake has support for regexing since forever
- `share/lib/python/scripts/binwrapper.py` does not need perl, this dependency was removed in #2960
- ~`src/nrnmpi/mkdynam.sh` -> `src/nrnmpi/mkdynam.py` the script has been refactored for readability and maintainability. Additionally, we unconditionally require Python at build-time anyways, and on Windows it makes no sense to depend on a POSIX-compatible shell (disclaimer: I did use LLMs for the rewrite, but I verified that the output is identical since the scope of the changes is very small. Not sure what is our stance on this from a copyright/other perspective though)~ gone

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `773e7f281d34`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.