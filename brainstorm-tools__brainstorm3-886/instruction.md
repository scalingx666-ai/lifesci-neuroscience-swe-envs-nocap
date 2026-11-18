# Issue

**Title:** Process: Better check for non existing process file. Add check for read permission

## Description

Hello, 

I just had a colleague having an issue with Brainstorm not being able to execute any process. It turned out that there was a lot of process in their path that involved broken symbolic links, causing issues in the parse process folder. 

This PR is now checking if the file actually exist (isfile) and addition to the existance of the file (exist) which return true even for broken symbolic links


This PR also adds a try/catch around fileread since this could also fail if the file exist but the user doesn't have read permission to the file.


Edouard


Note: isfile was added in matlab2017b. So we might need a warper around that for older version. i guess this can be implemented with a try/catch fopen of the file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c376d64ad2c1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.