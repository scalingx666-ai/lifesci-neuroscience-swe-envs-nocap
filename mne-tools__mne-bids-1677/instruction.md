# Issue

**Title:** Add agent guidance following MNE-Python

## Description

Trivial change to add AGENTS.md and CLAUDE.md following MNE-Python, plus a little bit of MNE-BIDS specific guidance. Same thing I've done for mne-qt-browser and mne-nirs etc.

I'll self-mark for merge-when-green so we have something in place, happy to make follow-up PRs if people have specific ideas for other stuff. But having this is definitely better than having nothing I think so better to get it in sooner rather than later. Changes drafted by Claude Opus 5.5 (hah!) and fully reviewed / understood by me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `623683b0615f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.