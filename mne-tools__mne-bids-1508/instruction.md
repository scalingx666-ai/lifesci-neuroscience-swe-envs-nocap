# Issue

**Title:** [MRG] Fix _find_matching_sidecar to search at dataset root level

## Description

PR Description
--------------
BIDS inheritance principle allows sidecars at the dataset root level that apply to all subjects. Previously, _find_matching_sidecar() only searched within sub-* directories.

This change adds a fallback search at the dataset root when no candidates are found in the subject directory. Root-level sidecars (files without 'sub-' in their name) are now considered.

Subject-level sidecars still take precedence over root-level ones, as expected by the BIDS inheritance model.

  Tested with the nm000105 (https://nemar.org/dataexplorer/detail?dataset_id=nm000105) EMG dataset which has coordsystem.json at root level.



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
- [ ] PR description includes phrase "closes <#issue-number>"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47b49127e072`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.