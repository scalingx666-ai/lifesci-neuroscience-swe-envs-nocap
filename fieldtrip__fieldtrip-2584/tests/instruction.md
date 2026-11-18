# Issue

**Title:** enhancement - make sure chantype is lower case

## Description

ft_apply montage uses isequal and that fails if case is different

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06b57e6b4d68`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.