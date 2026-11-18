# Issue

**Title:** FIX: example code was broken

## Description

When running the provided example, I got the following error:

Error in t.default(rsvd::rsvd(mat, nu = 0, nv = mxn)$v) :
 argument is not a matrix

I found that if either nu or nv is set to zero, then neither v nor u are returned. Setting nu to anything > 0 seems to fix it so that v is returned. I'm running rsvd 0.9, so not sure if it's a version dependent issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c0073367a37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.