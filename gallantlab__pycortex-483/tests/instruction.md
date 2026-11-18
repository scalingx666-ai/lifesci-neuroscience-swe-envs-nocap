# Issue

**Title:** Removed dependency on 'six' library

## Description

Backward compatibility with python2.X is no longer necessary, six is now more trouble than it is worth.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0c21186b1e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.