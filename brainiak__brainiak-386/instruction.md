# Issue

**Title:** Fixed unnecessary Pool creation in searchlight

## Description

When pool_size=1 the creation of a multiprocessing pool is unnecessary
and wasteful because data needs to be copied and sent to other process.
This would double the needed memory for each MPI task. In addition,
fork() can cause unpredictable behaviour in some MPI implementations,
see:

https://www.open-mpi.org/faq/?category=tuning#fork-warning

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40a8d15e756d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.