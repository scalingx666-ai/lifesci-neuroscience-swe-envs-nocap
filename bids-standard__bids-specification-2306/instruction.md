# Issue

**Title:** Add pre-commit invoked checker to spot bad JSON in .md and also fix detected bad JSONs

## Description

- Done with claude
- inspired by running into one in 

edit, mkdocs knows that JSON is broken and highlights it:

<img width="1746" height="808" alt="image" src="https://github.com/user-attachments/assets/6d41af7f-59a7-4cd7-8f13-f205c7b7f86c" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `92e540056a74`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.