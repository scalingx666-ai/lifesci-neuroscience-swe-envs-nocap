# Issue

**Title:** remove duplicated call

## Description

PR Description
--------------

I encountered a case where the same helper function (_write_coordsystem_json) was being called twice in a row in write_raw_bids:

https://github.com/mne-tools/mne-bids/blob/98cb9f5b83c697788a8992733a131eb635f32240/mne_bids/write.py#L2035-L2052

Origin seems to be 

This removes one of the duplicated calls.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98cb9f5b83c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.