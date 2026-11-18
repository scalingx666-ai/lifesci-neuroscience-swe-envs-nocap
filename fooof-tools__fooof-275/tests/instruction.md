# Issue

**Title:** [MNT] - Update makefile options for distributions

## Description

Adds some helper utilities to the module Makefile to assist with distributions

Note that this adds some updates to make commands for building and checking the distribution, and also a command for printing out the command to publish - but does not add a make command to actually publish (in case that's a bit too easy to do by accident). 

Note: if this looks good, we can also add it to our other module repositories.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94fa407a9cb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.