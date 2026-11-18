# Issue

**Title:** Remove editable property

## Description

Like briefly discussed in issue #652, there is no need for the `editable` property of a project anymore. This branch removes it. @fzadow: Could you please test if this makes a difference in loading time for you?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1895fd84f7a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.