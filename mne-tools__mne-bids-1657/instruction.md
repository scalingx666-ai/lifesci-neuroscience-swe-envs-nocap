# Issue

**Title:** Speed up BIDSPath.copy and BIDSPath.fpath

## Description

I'm looking into MNE-BIDS-Pipeline bottlenecks, and one is `BIDSPath.copy()`. Changes drafted by Claude Opus 5 and reviewed by me. Related to my previous PRs like  but this speeds things up even further using immutability (which I should have thought of sooner!).

@bruAristimunha can you look and see if you agree this speeds things up? :rocket: If so then I think we should be good to merge!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `41fa378f290f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.