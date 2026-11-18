# Issue

**Title:** Update scm_url to point to MHubAI repository

## Description

I migrated the V2 back into the original repository, I will archive the secondary repository, the one under the MHubAI organization will be the (only) repo where the SlicerMhubRunner extension is hosted.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cdd9c6b25a32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.