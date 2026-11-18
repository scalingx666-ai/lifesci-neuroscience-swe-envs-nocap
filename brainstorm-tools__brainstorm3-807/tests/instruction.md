# Issue

**Title:** Load map without std field

## Description

When testing the correlation fix in #806, i encounted this error: 

![image](https://github.com/user-attachments/assets/8671844e-cb9d-46f1-846e-55a5db72eac7)


This PR is here to fix it :)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e566a5f70185`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.