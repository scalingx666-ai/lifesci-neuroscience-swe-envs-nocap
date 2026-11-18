# Issue

**Title:** [datetime] Keep track of recording time trough the different processes

## Description

This makes sure all the common processes affect the date of acquisition well


- [x] Synchronize recordings
Done. I also added some information in the history about the offset between files. 

- [x] Combine recordings


Note: For synchronizing and combining recordings, I had to use a user-interaction to find what is the correct date when multiple dates are present. This won't work if those two processes are called from a. script. Is there a better way to do it?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a9ccf1c17079`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.