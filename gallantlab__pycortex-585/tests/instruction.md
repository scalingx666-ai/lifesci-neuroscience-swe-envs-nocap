# Issue

**Title:** FIX error if unsupported kwargs in make_figure

## Description

Protects against arguments being passed into the wrong method. Otherwise `make_figure` silently swallows extra `kwargs`.

(In a similar vein as #579.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ea87152d64c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.