# Issue

**Title:** add atlas name hinting

## Description

## Description
I always find myself needing to check the brainglobe documentation for atlas names. I realised it would be really nice if my IDE could suggest me valid atlas names. This is apparantly very doable and I have implemented it here. The main drawback is we would have a hardcoded atlas name list that we would need to update. We could have a test though that automatically checks for discrepencies between the remote last_versions.conf and our atlas_names.py

This is what it looks like in practice
<img width="732" height="286" alt="image" src="https://github.com/user-attachments/assets/0611d7f0-1dfd-4bbe-9b0c-b6abe9d2011f" />



**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other


## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `14affb7bf470`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.