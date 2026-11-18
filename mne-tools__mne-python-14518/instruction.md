# Issue

**Title:** Speed up annotation copying

## Description

When working on MNE-BIDS, I noticed that a lot of time was spent in `annotations.copy()`. This PR speeds that up by improving `__deepcopy__` based on knowing the types of what we're copying (similar to what we've done before with Info for example). Takes reading ~60 files down from ~3.6 to ~2.1s (so roughly ~55ms to ~31ms per file), with savings scaling based on the number of annotations.

These are pretty simple changes and I think we can trust our CIs to tell us if something is wrong here, so I'll self-mark for merge-when-green. Changes drafted by Claude Opus 5.5 and reviewed by me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `048c2695abc6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.