# Issue

**Title:** FIX: Fix Label.split losing vertex 0 and failing on unnamed labels

## Description

#### Reference issue (if any)
None.

#### What does this implement/fix?
Fixes two bugs in `Label.split`.

**1. `parts="contiguous"` drops vertex 0.**

When a label contains vertex 0, this vertex is missing from the resulting parts. For example, `precentral-lh` from the fsaverage aparc atlas contains 10740 vertices, while its contiguous parts only contain 10739.

The issue is caused by `_split_label_contig` passing vertex indices to `_get_components`, which expects a boolean mask. Consequently, vertex 0 is interpreted as `False` and excluded. The fix passes an all-true mask instead.

**2. Splitting unnamed labels raises an exception.**

Labels created without an explicit name have `label.name=None`. Both splitting modes use this name to construct the part names, resulting in an `AttributeError`.

Unnamed labels now produce parts named `unnamed_div1`, `unnamed_div2`, etc., consistent with the existing naming convention in `Label.__add__`, `Label.__sub__`, and `repr(Label)`. The duplicated naming logic has also been consolidated into a single helper.

Extended `test_split_label` to cover both issues using an unnamed label containing vertex 0 and its neighbors on the fsaverage sphere. The test verifies vertex preservation and correct naming for both splitting modes and fails on `main`.

#### Additional information
Identified while cross-validating the MNE-CPP label utilities against MNE-Python.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ec89de232bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.