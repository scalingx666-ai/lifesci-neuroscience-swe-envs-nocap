# Issue

**Title:** fix(menagerie): drop case-colliding classics alias stubs

## Description

Fixes the case-insensitive-filesystem clone collision (macOS) on three classics module pairs. The capitalized files were redundant alias stubs; the real lowercase modules already register the capitalized names. Registry unchanged (5149 entries, all three names still resolve); no collisions remain repo-wide.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e7af37a98ab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.