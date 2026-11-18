# Issue

**Title:** MultiModel notebooks: 3

## Description

advanced topics:
- how it actually works + tale of two backends
- exploration with `MultiModel`
- evolution with `MultiModel`
- how to adapt existing model (example: add adaptation current to Wilson Cowan model)
(3rd PR in #159)

P.S. will wait for #161 to be merged, then rebase

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64d833fda473`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.