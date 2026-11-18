# Issue

**Title:** ENH: Read epoched FIF files in read_epochs_bids

## Description

PR Description
--------------

Part of #1676. .

**`read_epochs_bids` can now read epoched FIF files**

#1605 added `read_epochs_bids` for EEGLAB `.set` files and for continuous formats flagged as epoched.

Three small changes:

1. `.fif` is registered as an epoch reader, using `mne.read_epochs`.
2. `_get_readers` also looks in the top-level `mne` namespace, because `read_epochs` is not in `mne.io`.
3. MNE's file-name warning is silenced for this read. BIDS names the file `*_meg.fif`, and MNE expects `-epo.fif`.

`read_raw_bids` now points to `read_epochs_bids` for such files, as it already does for `.set`.

**Test.** The existing `test_read_epochs_bids_eeglab` now runs for `.set` and `.fif`: the same epochs are saved as FIF under a BIDS name and go through the same checks.

**AI disclosure.** I used Opus 5.5 to help write the code and draft this description. I reviewed all changes.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a806a1e4d0cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.