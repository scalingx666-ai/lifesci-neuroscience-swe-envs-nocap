# Issue

**Title:** [MRG] ENH: Allow path-like input in read_raw_bids

## Description

PR Description
--------------

.

Allow `mne_bids.read_raw_bids` to accept path-like (`str | os.PathLike`) inputs directly by converting them via `get_bids_path_from_fname(bids_path, check=False)` when `not isinstance(bids_path, BIDSPath)`.

Merge checklist
---------------

Maintainer, please confirm the following before merging.
If applicable:

- [ ] All comments are resolved
- [ ] This is not your own PR
- [ ] All CIs are happy
- [x] PR title starts with [MRG]
- [x] [whats_new.rst](https://github.com/mne-tools/mne-bids/blob/main/doc/whats_new.rst) is updated
- [x] New contributors have been added to [CITATION.cff](https://github.com/mne-tools/mne-bids/blob/main/CITATION.cff)
- [x] PR description includes phrase "closes <#issue-number>"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae1c79a9eb75`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.