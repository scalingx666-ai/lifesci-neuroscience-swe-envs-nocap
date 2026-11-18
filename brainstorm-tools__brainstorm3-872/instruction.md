# Issue

**Title:** [align sensors] Select study when applying transformation to other study

## Description

When doing the co-registration and brainstorm, ask me if i want to apply co-registration to other sensors in the database, i am always scared as it doesn't tell me what file will be modified. (especially when having multiple sessions within the same subject). 

So now brainstorm ask which file should be modified so the user can check.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `38b609a0ef28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.