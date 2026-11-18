# Issue

**Title:** Fix import handling for filelock dependency

## Description

<!--
Thanks for contributing this pull request (PR).
If this is your first time, make sure to read
[CONTRIBUTING.md](https://github.com/mne-tools/mne-bids/blob/main/CONTRIBUTING.md)
-->

PR Description
--------------

Improve error handling by ensuring lock helpers skip reference counting when the optional `filelock` dependency is missing, preventing potential crashes during reads.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e7635a3b010e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.