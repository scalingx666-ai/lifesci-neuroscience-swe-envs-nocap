# Issue

**Title:** Fix anaconda release again

## Description

Ok, so I did some debugging on my fork and fixed a few more issues with the anaconda release. This gets as far as authentication errors on my fork (no secrete present), so I think it should work now. Main issues fixed:

- Needed to setup anaconda-client properly on the job
- Find command wasn't returning errors from the exec call, changed to a for loop so the job fails if we have a failing upload command.
- Fixed the badge on the README, more needs to be updated with the instructions.

Hopefully fifth time is the charm!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3fda3d0eb2c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.