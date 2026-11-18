# Issue

**Title:** [MRG] ENH: Preserve enriched dataset_description.json and user-authored README

## Description

PR Description
--------------

Two MOABB-driven friction points in ``write_raw_bids``:

- **README** (#1550): add ``readme=True/False`` parameter; default keeps current append-refs behavior; ``readme=False`` skips creating/modifying the file entirely. Also fix racy ``lock→read→unlock→write`` in ``_readme`` to a single lock for the full read-modify-write.
- **dataset_description.json** (#1548): preserve BIDS-spec keys not modeled by ``make_dataset_description`` (e.g. ``Description``, ``DatasetLinks``) when merging with an existing file.

. .

Merge checklist
---------------

- [ ] All comments are resolved
- [ ] This is not your own PR
- [ ] All CIs are happy
- [ ] PR title starts with [MRG]
- [x] [whats_new.rst](https://github.com/mne-tools/mne-bids/blob/main/doc/whats_new.rst) is updated
- [ ] New contributors have been added to [CITATION.cff](https://github.com/mne-tools/mne-bids/blob/main/CITATION.cff)
- [x] PR description includes phrase "closes <#issue-number>"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc9e94525d2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.