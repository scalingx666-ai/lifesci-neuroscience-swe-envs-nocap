# Issue

**Title:** dvid 3d stack group import produces keyword error

## Description

On trying to import a 3d stack group, you get an error in StackStackGroup about an invalid keyword argument `stackgroup`. This fixes the reference to `stack_group` and the import now completes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ecb0324d749d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.