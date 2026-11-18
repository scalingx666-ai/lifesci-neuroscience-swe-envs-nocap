# Issue

**Title:** Eyelink

## Description

In order to facilitate alignment between eyelink data, and data that has been simultaneously acquired on another acquisition system, it would be nice to have the 'msg' also represented as events (after ft_read_event). This PR creates 'msg' type events, based on the assumption that the messages are represented in the ascii file by a 'sample' column + a 'message' string.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cecfe234c322`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.