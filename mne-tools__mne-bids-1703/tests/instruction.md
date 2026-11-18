# Issue

**Title:** [MRG] FIX: Skip an events.json sidecar that is not a JSON object

## Description

PR Description
--------------

Part of #1702. `read_raw_bids` failed with `AttributeError` on OpenNeuro ds004588, whose root `task-unnamed_events.json` is `[]`. A non-object `events.json` is now skipped with a warning, like an unreadable one. Test: `test_read_raw_bids_non_object_events_json`.

Not changed here: the other sidecar reads (`*_eeg.json`, `dataset_description.json`, `RecordingType`, `EpochLength`, T1w landmarks) fail the same way on a non-object file.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c8a5d99920a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.