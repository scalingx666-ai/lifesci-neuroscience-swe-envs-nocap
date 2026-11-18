# Issue

**Title:** set channels type from bids

## Description

Not sure why, but channel types found in bids sidecar _channels.tsv isn't ported into hdr.
If that was a mistake, then this should fix it...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b350a25efd4c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.