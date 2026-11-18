# Issue

**Title:** Avoid copies and support larger files in EEGLAB export

## Description

In  and related issues people wanted to a) support writing files > 2GB and b) avoid making copies when possible when exporting EEGLAB data. This PR enables those for people using latest eeglabio (). Assuming this comes back green, once we merge I'll release eeglabio 0.1.4. Also catches spurious warnings in pymatreader [for float32/single format](https://gitlab.com/obob/pymatreader/-/merge_requests/57). Changes drafted by Claude Opus 5.5 and understood and iterated on by me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `311ce1ff0816`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.