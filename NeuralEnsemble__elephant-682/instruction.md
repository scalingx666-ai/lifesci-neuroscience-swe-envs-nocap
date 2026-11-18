# Issue

**Title:** Fix Read the Docs build

## Description

**Bug**
- ReadTheDocs builds were failing due to an MPI-related error.  
- Likely caused by internal changes to the RTD build environment where `openmpi` is no longer available by default.

**Fix**
- Added `apt install openmpi` commands to the `readthedocs.yml` file.  
- Updated `environment.yml` to include the `openmpi` package.  
- Moved the explicit `openmpi` (and other packages) installation in `CI.yml` into `environment.yml` for consistency.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ef4755cc4b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.