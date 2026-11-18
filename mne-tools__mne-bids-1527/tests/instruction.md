# Issue

**Title:** Allow task=None in read_raw_bids for BIDS paths without task entity

## Description

<!--
Thanks for contributing this pull request (PR).
If this is your first time, make sure to read
[CONTRIBUTING.md](https://github.com/mne-tools/mne-bids/blob/main/CONTRIBUTING.md)
-->

PR Description
--------------

## Summary
Allow `read_raw_bids` to accept BIDSPath instances with `task=None`, supporting BIDS datasets that omit the task entity in the path (e.g. some anatomical or non-task recordings).

## Changes
- **mne_bids/read.py**
  - Require only `root` and `subject` on `bids_path` (removed `task` from required attributes).
  - When deciding whether to ignore missing events, guard `bids_path.task.startswith("rest")` with `bids_path.task is not None` to avoid AttributeError when task is None.

## Datasets this fixes
OpenNeuro datasets that previously failed with `RuntimeError: BIDSPath missing task` and are fixed by this change:
- ds002791
- ds003420
- ds003498
- ds004017

## Minimal self-contained example

This example downloads one subject from the ds002791 OpenNeuro dataset, then reads the data using a `BIDSPath` that does **not** set the `task` entity (only `subject`, `session="spelling"`, `run=1`, and `datatype="eeg"` are set). On **main**, this results in `RuntimeError: "bids_path" must contain 'root', 'subject', and 'task'`; with this PR it runs successfully.

```python
# Minimal example: read without setting task (fails on main, passes with this PR)
import warnings
warnings.filterwarnings("ignore")

import tempfile
from pathlib import Path

import openneuro
from mne_bids import BIDSPath, read_raw_bids

# Download one subject from a dataset that can be read without task in the path
dataset = "ds002791"
target = Path(tempfile.mkdtemp(prefix="bids_")) / dataset
openneuro.download(dataset=dataset, target_dir=str(target), include="sub-01")

bids_root = target
bids_path = BIDSPath(
    root=bids_root, subject="01", session="spelling", run=1, task=None, datatype="eeg"
)

raw = read_raw_bids(bids_path, verbose=False)
print(f"Read {raw.filenames} successfully with task=None.")
```

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ceb53f0724e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.