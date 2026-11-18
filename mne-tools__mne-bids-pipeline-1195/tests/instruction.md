# Issue

**Title:** ENH: Add support for smoothing steps

## Description

No need for changelog update I think since this seems like a within-cycle thing... when sessions are missing we need to be smarter about grand-averaging and make sure we're using ones that are valid for the given session only.

*EDIT: Changelog added because I modified the PR :point_down:*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cbe638e14d29`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.