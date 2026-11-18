# Issue

**Title:** Fix have_consumers staying true after an idle consumer disconnects

## Description

The transfer thread only noticed a disconnected peer after a failed write. Outlets that were not pushing never unregistered the queue. Watch the TCP socket for peer close so an idle outlet unregisters the consumer without waiting for a push.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a965060c6e9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.