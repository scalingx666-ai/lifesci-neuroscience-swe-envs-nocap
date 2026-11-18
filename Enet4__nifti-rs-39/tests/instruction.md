# Issue

**Title:** Fix Big Endian writing

## Description

Also introducing the longest turbo fish I ever made. :neutral_face: This was a consequence of distinguishing the array's element type `A` from the array's "atomic element" type `B`. In RGB, `A = [u8; 3]` and `B = u8`, whereas so far `A = B` for other cases. With this extra type parameter, we can use the same functions for both.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a91242d1dbc9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.