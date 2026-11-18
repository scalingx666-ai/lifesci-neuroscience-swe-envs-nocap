# Issue

**Title:** Install aux files to /usr/share on linux

## Description

.

Install auxiliary files in `${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}` when `LSL_UNIXFOLDERS` is enabled, which defaults to `/usr/share/${PROJECT_NAME}` for packages.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc7e38c643e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.