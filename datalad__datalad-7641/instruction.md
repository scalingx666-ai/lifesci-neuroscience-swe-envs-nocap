# Issue

**Title:** Exit with the original non-0 exit code if underlying functionality, in particular "datalad run", returned incomplete result record with a non-0 exit code

## Description

- pretty much @mih code from comment within that issue
- I just modified it to return first (not last) and non-0 code, not just last one and happen somehow that there are 0 exit codes - debug log about them.
- added a test

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `364079036a5a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.