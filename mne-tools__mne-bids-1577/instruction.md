# Issue

**Title:** Speedup more get entity vals

## Description

PR Description
--------------

Avoid search deeper than necessary through the dir tree when searching for subjects (maxdepth=1) or sessions (maxdepth=2).

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e6f44698b8d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.