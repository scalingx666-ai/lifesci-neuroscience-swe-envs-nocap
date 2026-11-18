# Issue

**Title:** Speed up bin shuffling

## Description

Sorry, for spamming with pull requests. 
I just recognized that the continuous time bin shuffling is incredibly slow for large spike trains. So I just made a time profiling. 
Basically splitting first the bin indices array into chunks, since indexing on large arrays takes forever.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f20f071d487b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.