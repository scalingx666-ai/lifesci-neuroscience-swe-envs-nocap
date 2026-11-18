# Issue

**Title:** feat: add fix_borders parameter & max_paths parameter

## Description

Currently out out-of-core skeleton joining code relies on a conservative 50% overlap in order to make sure we have nicely fused skeletons. However, it may be possible to achieve 1 pixel overlap, which would mean an 8x reduction in core-hours and fragment generation. Let's explore this idea...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54b93e938c78`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.