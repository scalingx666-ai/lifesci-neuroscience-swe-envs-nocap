# Issue

**Title:** issue-554 fix.  Default to spatial scale of 1 if estimation fails.

## Description

.

If spatial_scale estimation fails:
  - warns instead of errors out.
  - defaults to 1

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `72489f874e71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.