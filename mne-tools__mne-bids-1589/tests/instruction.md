# Issue

**Title:** [MRG] ENH: Demote format-conversion warnings to log messages

## Description

<!--
Thanks for contributing this pull request (PR).
If this is your first time, make sure to read
[CONTRIBUTING.md](https://github.com/mne-tools/mne-bids/blob/main/CONTRIBUTING.md)
-->

PR Description
--------------

When users explicitly request a target format via `write_raw_bids(format=...)`, two `RuntimeWarning`s were previously emitted that duplicated each other in spirit:

1. `"Converting data files to <FORMAT> format"` (outer notice, before each writer call)
2. `'Encountered data in "<FMT>" format. Converting to float32.'` (inner notice from the BrainVision writer)

These notices are noise when the conversion was explicitly requested by the user, and downstream projects (e.g. [MOABB](https://github.com/NeuroTechX/moabb)) have to suppress them with `warnings.filterwarnings(...)` boilerplate around every `write_raw_bids` call.

This PR demotes both notices to log messages instead of warnings:

- The outer `"Converting data files to <FORMAT> format"` (BDF/EDF, EEGLAB, BrainVision branches) is now `logger.info(...)` — visible at the default MNE log level, so users still see what's happening.
- The inner `'Encountered data in "<FMT>" format. Converting to float32.'` is now `logger.debug(...)` — hidden by default since it's an implementation detail; visible via `mne.set_log_level("debug")`.

Source change is 4 sites in `mne_bids/write.py`. The bulk of the diff is test cleanup: dropping `pytest.warns(...)` matchers for warnings that no longer fire.

.

Merge checklist
---------------

Maintainer, please confirm the following before merging.
If applicable:

- [ ] All comments are resolved
- [ ] This is not your own PR
- [ ] All CIs are happy
- [ ] PR title starts with [MRG]
- [x] [whats_new.rst](https://github.com/mne-tools/mne-bids/blob/main/doc/whats_new.rst) is updated
- [ ] New contributors have been added to [CITATION.cff](https://github.com/mne-tools/mne-bids/blob/main/CITATION.cff)
- [x] PR description includes phrase "closes <#issue-number>"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e92e3142f19c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.