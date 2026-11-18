# Issue

**Title:** [fix] fix Seaborn positional arguments problem

## Description

From Seaborn version 0.12, the only valid positional argument will be 'data'. Passing other arguments without an explicit keyword will result in an error or misintertpretation. Fixed by explicitly passing x, y variables as keyword arguments to sns.barplot() call.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d588f7f5679`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.