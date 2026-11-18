# Issue

**Title:** [MRG] ENH: Add read_participants

## Description

PR Description
--------------

. Adds `read_participants(fname, *, content=None)`, built on `_from_tsv`: rows keyed by subject label, `n/a` as `None`, values as strings; `content=` takes the bytes of a file that is not on a local disk. Test: `test_read_participants`.

AI use: written with Claude Code (Anthropic); I reviewed and tested the changes.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cefe6a86d9dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.