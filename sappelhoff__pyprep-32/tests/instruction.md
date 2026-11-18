# Issue

**Title:** lesser ram ransac

## Description

# PR Description

Adding a lesser hungry version of the ransac albeit slower since it is done channel by channel. As of now it will try to execute the fast ransac and if that fails will try to do the channel-wise ransac. It is about 5 to 6 times slower than the ram hungry version.

Would close #17 and close #19 also  

Edit: Optimized, now ransac will automatically find the largest chunk of channels it can take at a time without running out of ram.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69994f84ff1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.