# Issue

**Title:** Raise PARRECError for an image information line with too few values

## Description

An image information line cut short raised IndexError, or a ValueError from an array broadcast, instead of PARRECError. This change counts the values on each line and raises PARRECError when there are too few.

One behavior change: a V4.1 image line with 46 of its 48 values used to load without an error, with the diffusion field filled in from one value (giving [0, 0, 0]). It now raises. The bundled V4.1 sample still parses, and lines with extra values are still accepted. Two regression test cases fail on master and pass with this change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ac55aacc9cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.