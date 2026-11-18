# Issue

**Title:** added acq_details options

## Description

This is a simple one-file PR -- I've added some processing flags to aas_processBIDS, tweaked string processing in one place to fix a bug when one event name is contained in another, and done some cosmetic clean up.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `05be61d51861`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.