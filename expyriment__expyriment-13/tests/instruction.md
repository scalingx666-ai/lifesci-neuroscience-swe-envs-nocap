# Issue

**Title:** Global mouse

## Description

It was rather simple.... Please merge!

Some internal functions like Testsuite create a temporary own mouse instances. However, that does make a difference, because they have to switch on/off the cursor anyway, depending on their task.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa01ebed82c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.