# Issue

**Title:** fix: Resolve crashes when running workflows with updatehash=True

## Description

Any workflow running with updatehash=True will crash

That happens because in nodes.py line 457 we try to update the hashfile even if the node was never executed before, so no hashfile is found and _update_hash function raises an exception.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc456dd985b7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.