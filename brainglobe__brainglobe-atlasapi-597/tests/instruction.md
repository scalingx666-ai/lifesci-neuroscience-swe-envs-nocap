# Issue

**Title:** change from imsave to imwrite, updated version requirement for tifffi…

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
 tifffile.imsave() has been completely removed since February 2025. Fortunatley, we have only one spot to fix.
**What does this PR do?**
change to use tifffile.imwrite() instead of imsave and update the version requirement for tifffile(tifffile>=2018.11.6)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `49f3c6cab302`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.