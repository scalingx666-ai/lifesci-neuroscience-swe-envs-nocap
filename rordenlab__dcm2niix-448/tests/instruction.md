# Issue

**Title:** Remove redundant underscores before creating subdirectories

## Description

The code introduced in commit d88da85 to (once again) collapse underscores in filenames seems to appear too late in the logic of the function, if subdirectories need to be created. In this case the uncollapsed directory name will be created, resulting in a subsequent failure to create files within the directory with the collapsed name, since it hasn't been created.

I've moved this logic slightly earlier in the function to resolve the issue. This seems to work correctly in my limited testing, but I may have missed some possible code-paths so it's worth double-checking the new placement.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e20c4ec3a95`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.