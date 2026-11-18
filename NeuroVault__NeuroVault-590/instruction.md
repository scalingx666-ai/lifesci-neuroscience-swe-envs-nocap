# Issue

**Title:** Add a `private` property to the collections api response

## Description

This PR adds `private` property to collection objects in the API response. 

It went missing in 371fa8539a6aecbbe784da3f703f6af96487b775. Is the reason for excluding it still relevant?  Now as we have `my_collections` endpoint, `private` could be quite useful.

If it's OK to bring it back, I'll add some tests to the PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a9f2b1a4f51`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.