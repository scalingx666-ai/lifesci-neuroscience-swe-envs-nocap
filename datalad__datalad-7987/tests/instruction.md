# Issue

**Title:** tests: wait for child process to exit in test_get_open_files

## Description

test_get_open_files() sent SIGTERM to the child process but did not wait for it to terminate before checking that get_open_files() reports no open files.  On a single-CPU system the child may not have been scheduled to process the signal yet, so its working directory was still reported and the test failed, aborting the package build.

Wait for the child to exit (and be reaped) to make the check deterministic regardless of the number of CPUs.

Fixes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e10c97bca16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.