# Issue

**Title:** fix(server): Lower MongoDB timeouts to avoid throwing errors after connection close

## Description

The default timeouts here are 30 seconds which can easily block longer than the available HTTP timeout. Lowering these to 5-10 seconds will fail faster in the case of connection issues and produce better error messages than a 502 Bad Gateway error.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f6ac78487418`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.