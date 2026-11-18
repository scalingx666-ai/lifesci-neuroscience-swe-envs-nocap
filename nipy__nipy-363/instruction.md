# Issue

**Title:** MRG: rewritten, extended fix for reg script affine

## Description

A rewrite and extension of the PR

Adds more general handling of affine, writing of the TR into the affine, and
more general handling of filenames with dots in them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a39b38710da0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.