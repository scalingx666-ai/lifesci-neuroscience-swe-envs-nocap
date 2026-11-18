# Issue

**Title:** add curryreader as full dep

## Description

<!--
Thanks for contributing this pull request (PR).
If this is your first time, make sure to read
[CONTRIBUTING.md](https://github.com/mne-tools/mne-bids/blob/main/CONTRIBUTING.md)
-->

PR Description
--------------

 switched MNE-Python to use https://github.com/mne-tools/curry-python-reader/ for reading Neuroscan Curry files.  CIs that use MNE main have started failing for not having curryreader installed.

 (supersedes)
 (supersedes)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e0a96e132fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.