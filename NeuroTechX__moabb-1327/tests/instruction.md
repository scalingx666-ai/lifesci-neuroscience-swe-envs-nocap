# Issue

**Title:** Let get_data return nested trials when recordings differ in channels or samples

## Description

First of three steps from the review of #1305 (cross-system evaluation): make the existing API handle recordings of different shapes, so no new evaluation class is needed.

**Where it broke.** `BaseParadigm.get_data` ends with `np.concatenate(X)` (or `mne.concatenate_epochs`). Datasets with different montages or sampling rates pooled in a `CompoundDataset` failed there: "all the input array dimensions ... must match exactly".

**Change** (+40 lines of code):
- same-shaped recordings still give a regular array; otherwise `get_data` returns a nested object array of shape `(n_trials,)` with each trial's `(n_channels, n_times)` array (logged at WARNING);
- `_get_nchan` accepts nested arrays (largest channel count), the only evaluation code that read `X.shape[1]`;
- `return_epochs=True` on such recordings raises a clear error pointing to array output (`mne.Epochs` cannot hold them).

With it, leave-one-dataset-out runs with what exists: `CrossSubjectEvaluation(datasets=[compound], cv_class=LeaveOneGroupOut, groups=...)`.

**Tests**: nested output and the regular case (`test_paradigms.py`), Epochs error, and a leave-one-system-out `CrossSubjectEvaluation` on two fake systems with different channels and rates (`test_evaluations.py`). `test_evaluations.py` and `test_paradigms.py` pass locally.

Next: a PR making the grouping explicit (a `dataset` metadata column for `CompoundDataset`, so `groups="dataset"`), then #1305 becomes a tutorial.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `49bc8559188e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.