# Issue

**Title:** Speedup get_entity_vals

## Description

PR Description
--------------

Scanning for entity values has ignore_dirs option that is applied _after_ listing all files. This is suboptimal.

- Changed scanning strategy to prevent globing into unwanted directories. Using os.walk and discarding unwanted dirs during scanning.
- Add ignore_hidden bool option to prevent descending in .git and other hidden dirs.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b77bd7b9672`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.