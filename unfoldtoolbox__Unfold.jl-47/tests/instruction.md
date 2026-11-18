# Issue

**Title:** fix Project.toml

## Description

Note that it still includes a lot of things that should be just in the Test environment (e.g. Test), but we can work on a leaner release later. :smile:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c407b7651414`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.