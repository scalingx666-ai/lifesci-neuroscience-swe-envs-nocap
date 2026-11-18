# Issue

**Title:** Raise an error when attempting stream resolution with an malformed query

## Description

At the moment, resolving streams with an invalid query silently fails (i.e. no streams are found).

This PR checks the query and throws an exception on failure before even sending the stream query packets.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1bccbb6d5b1d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.