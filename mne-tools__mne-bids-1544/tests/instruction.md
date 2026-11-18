# Issue

**Title:** ENH: Make MRI defacing function public (cf issue: #1529)

## Description

PR Description
--------------

This PR exposes a previously private function for defacing MRI's to the public API. It  

Additionally, tests are added for testing the defacing function, and fixtures necessary for testing are added as well. 

Merge checklist
---------------

Maintainer, please confirm the following before merging.
If applicable:

- [x] All comments are resolved
- [x] This is not your own PR
- [x] All CIs are happy
- [ ] ~~PR title starts with [MRG]~~
- [x] [whats_new.rst](https://github.com/mne-tools/mne-bids/blob/main/doc/whats_new.rst) is updated
- [x] New contributors have been added to [CITATION.cff](https://github.com/mne-tools/mne-bids/blob/main/CITATION.cff)
- [x] PR description includes phrase "closes <#issue-number>"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35b511983b7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.