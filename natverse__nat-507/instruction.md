# Issue

**Title:** Switching off patch in codecov

## Description

Not sure if patch checks of coverage are necessarily needed in some cases. More important is the overall coverage of the whole package.
And failing reports of them are quite annoying.
I decided to switch them off, but we can alternatively lower the threshold, or something.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46e4626d79d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.