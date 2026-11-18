# Issue

**Title:** BUG: Properly clean up on del

## Description

This should fix a bug @drammock hit where memory consumption crept up with multiple `fig` use and `mlab.options.offscreen=True`. Basically we should make sure we close the figures we create, since the offscreen ones can stay open and consume memory.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e85753e35a2a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.