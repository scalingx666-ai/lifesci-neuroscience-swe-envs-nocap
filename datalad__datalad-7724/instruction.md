# Issue

**Title:** Merge maint (1.1.6) into master

## Description

For some reason there are differences in acknowledgements etc. The only functional difference we have is removal of import in `consts`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2569b965981b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.