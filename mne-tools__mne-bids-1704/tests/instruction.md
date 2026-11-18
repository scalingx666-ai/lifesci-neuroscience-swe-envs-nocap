# Issue

**Title:** [MRG] FIX: Match NIRS channels on source, detector and wavelength

## Description

PR Description
--------------

Part of #1702. OpenNeuro ds004830 names NIRS channels `S1-D1-690.0` in `channels.tsv`, while MNE names them `S1_D1 690`, so `read_raw_bids` raised a channel mismatch. When the `source`, `detector` and `wavelength_nominal` columns give exactly the raw channel names, those names are used; otherwise nothing changes. Test: `test_nirs_channel_names_from_columns`.

AI use: written with Claude Code (Anthropic); I reviewed and tested the changes.

Merge checklist
---------------

Maintainer, please confirm the following before merging.
If applicable:

- [ ] All comments are resolved
- [ ] This is not your own PR
- [ ] All CIs are happy
- [ ] PR title starts with [MRG]
- [ ] [whats_new.rst](https://github.com/mne-tools/mne-bids/blob/main/doc/whats_new.rst) is updated
- [ ] New contributors have been added to [CITATION.cff](https://github.com/mne-tools/mne-bids/blob/main/CITATION.cff)
- [ ] PR description includes phrase "closes <#issue-number>"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3663da9f4b6e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.