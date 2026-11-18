# Issue

**Title:** APIS-1191 Clear recorders after binary conversion

## Description

Replaces the recorders of the Explore object with an empty dict after binary file conversion finishes.
This PR also unsubscribes them before replacing self.recorders, which isn't strictly necessary because the stream processor is replaced on connect anyway - but if we ever change behaviour, this would be marginally safer?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8fc427e27c69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.