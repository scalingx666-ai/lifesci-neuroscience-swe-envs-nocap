# Issue

**Title:** DOC: Update license to comply with JOSS

## Description

This PR .

It renames the COPYRIGHT file inherited from CMP2 to LICENSE and removes the part

> THIS SOFTWARE IS FOR RESEARCH PURPOSES ONLY AND SHALL NOT BE USED FOR
ANY CLINICAL USE.

to make it a pure 3-clause BSD license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3a1f554b8b2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.