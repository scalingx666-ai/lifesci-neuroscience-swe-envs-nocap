# Issue

**Title:** Fix pg13-related build issues

## Description

At some point the ubuntu-18.04 image seems to have changed so that this
package isn't included, so trying to remove it broke the build.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc066c5cfc86`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.