# Issue

**Title:** BUG: float type for posterior sum caused overflow on large images

## Description

@ntustison , I tried replacing RealType with double in the segmentation filter, but it caused a lot of compile errors, including Atropos.cxx and the ParzenWindow classes. So I just changed the posterior summation here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9aebf5abddee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.