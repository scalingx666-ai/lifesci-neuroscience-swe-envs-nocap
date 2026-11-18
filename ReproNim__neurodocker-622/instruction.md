# Issue

**Title:** FIX remove comment from freesurfer env line

## Description

In the freesurfer template there was a leftover comment that ended up in one of the env variables (`FSF_OUTPUT_FORMAT`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1719727d53a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.