# Issue

**Title:** Prepare for 0.6 release

## Description

- Removed the doc page on how to set values in a config file ()
- Fixed parsing of `(width, height)` in the command line interface.

Anything else before the release?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a671d73f8185`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.