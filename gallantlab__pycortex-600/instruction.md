# Issue

**Title:** FIX pickerfun Python callback

## Description

This restores the old jQuery mechanism from 77a24b58e00a8e0ecdc9a04342a6a3c225e22e22 . I don't know what the pros/cons are of this versus the `notify` mechanism from legacy (3595800b4b0310a070f28c5fa60e11f3ff10c4a0).

 .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe46c5d34f21`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.