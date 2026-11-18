# Issue

**Title:** [FIX] Fix import error due to deprecated matplotlib function

## Description

Matplotlib deprecated register_cmap function since 3.7.0, so an equivalent function is now being called under the same name

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `398ec9416d30`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.