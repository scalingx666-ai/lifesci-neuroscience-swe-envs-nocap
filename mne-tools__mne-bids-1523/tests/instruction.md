# Issue

**Title:** Fix coordenation

## Description

<!--
Thanks for contributing this pull request (PR).
If this is your first time, make sure to read
[CONTRIBUTING.md](https://github.com/mne-tools/mne-bids/blob/main/CONTRIBUTING.md)
-->

PR Description
--------------

According to BIDS, if it is a derivative, it should include the coordinate system for EEG, besides this:

  - For iEEG: both files are unconditionally REQUIRED -- the current RuntimeError is correct;
  - For EEG: electrodes.tsv is only RECOMMENDED, but if you include it, coordsystem.json MUST accompany it -- our warning is appropriate (the dataset is technically non-compliant but we can still read it)
  - For MEG: coordsystem.json is OPTIONAL at baseline, but the same conditional rule applies -- if electrodes.tsv exists, coordsystem.json MUST exist too

This was overly strict for EEG and MEG, where datasets in the wild often lack coordsystem.json, causing reads to fail unnecessarily.

  This PR differentiates the behavior by modality:
  - iEEG: keeps the strict RuntimeError (coordinates are essential for intracranial data)
  - EEG / MEG: emits a RuntimeWarning referencing the BIDS specification and continues without applying a montage (dig is set to None for EEG, preserved from the raw file for MEG)

  Also fixes the on_error parameter for the sidecar search to use the datatype instead of the suffix, and restructures the logic to remove redundant checks.

  Changes:

  - mne_bids/read.py: use datatype (not suffix) for on_error selection; warn instead of raise for EEG/MEG; clean up with else branch instead of duplicate condition
  - mne_bids/tests/test_read.py: add test_read_eeg_missing_coordsystem_warns, test_read_eeg_root_electrodes_no_coordsystem, test_read_meg_missing_coordsystem_warns; update iEEG test match
  string
  - doc/whats_new.rst: add changelog entry

**Note:** The datasets listed previously are **not** failing due to a regression in mne-bids. I got confused and incorrectly associated the errors with this change. There is no regression — those datasets have other issues unrelated to this PR.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `43aa5bb0ca93`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.