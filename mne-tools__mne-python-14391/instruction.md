# Issue

**Title:** PERF: Optimize multidimensional indexing in Epochs.get_data()

## Description

### summary

in `BaseEpochs._data_sel_copy_scale`, when `select` (from `item`) and `picks` are both arrays, the code does two fancy indexings back to back:

```python
data = data[select][:, picks]
```

the first one, `data[select]`, makes a full 3d intermediate array that is only used to pick channels right after.

### changes

switched to orthogonal indexing, `data[select[:, None], picks]`. numpy now pulls out the sub-volume in one go, with no intermediate array.

### benchmark

5,000 subselections on a `(200, 128, 500)` epochs array:

- before: 3.769 s
- after: 0.026 s (~140x faster)

added tests in `mne/tests/test_epochs.py::test_get_data_copy` that check the results match across array and slice combinations.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1d318cb8c2a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.