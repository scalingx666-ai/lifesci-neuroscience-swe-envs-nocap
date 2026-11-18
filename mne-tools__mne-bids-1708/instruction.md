# Issue

**Title:** [MRG] ENH: Add find_inherited_sidecars to choose inherited sidecars from a list of paths

## Description

PR Description
--------------

Part of #1702. Adds `find_inherited_sidecars(fname, candidates, *, root, extension=".json")`: from a list of paths, the sidecars that apply to a recording under the BIDS inheritance principle, ordered from the root down. It only compares strings, so URLs such as `hf://` keep their double slash. Test: `test_find_inherited_sidecars`.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eb2fc6f55841`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.