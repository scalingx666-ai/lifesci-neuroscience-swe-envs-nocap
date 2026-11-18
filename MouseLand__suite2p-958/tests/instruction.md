# Issue

**Title:** Dependency and GUI updates

## Description

Fixes GUI issues mentioned in: 

- #954 
- #951 

Fixes dependency issues with latest version of numpy and `np.bool`:
- #953 

`bin_frames` has also been patched to accommodate cases in which current batch has fewer frames than `bin_size`:
- #930

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8d2c28a9846`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.