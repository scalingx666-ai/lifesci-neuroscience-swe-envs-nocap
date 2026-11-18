# Issue

**Title:** FIX afni installation

## Description

Related to 

This PR fixes the AFNI installation with reproenv. The first commit replaces `printf` with `echo` in the json saving command, because strings like URLs can contain `%` which `printf` thinks are directives.

Subsequent commits will fix AFNI's installation in reproenv.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `106539f7fc28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.