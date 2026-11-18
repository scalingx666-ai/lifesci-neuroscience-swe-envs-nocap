# Issue

**Title:** Modify regex to extract "3d" as valid word in tutorial title

## Description

@mirams looks my regex was the problem!

"3d" should now be treated correctly as a word when turning the filename into a tutorial title.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `babb7e0881f3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.