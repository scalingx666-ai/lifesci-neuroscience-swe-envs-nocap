# Issue

**Title:** Escape period in extension regex

## Description

Escapes the period in the extension regex. Caught this because `{suffix}_channels.{extension}` was passing and causing duplicate entries. This should fix that, and the test change should confirm it!

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59090651a40c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.