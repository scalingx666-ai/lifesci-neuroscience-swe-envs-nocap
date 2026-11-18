# Issue

**Title:** Add module makefile

## Description

Add's a makefile, to work with the module, that is designed to replace `summary.sh`. 

Goals for review:
- can you run all the make targets, and do they seem to work?
- any thought on naming structure, organizations, additions, or anything else for this?

Note - this idea partially based on this example:
https://github.com/nltk/nltk/blob/develop/Makefile

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dce05cb1a8bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.