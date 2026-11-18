# Issue

**Title:** ENH: Stop printing false positive differences when logging cached nodes

## Description

The function calculating changed input fields did not preempt the problem of comparing tuples vs. lists in most of the cases. This PR simplifies the logic of the `dict_diff` accessory function, and fixes the issue - resulting in way shorter indices of changed inputs (esp. when an interface has several inputs and some of them contain long lists).

This issue translated in practice into showing long lists of unchanged values as if they had changed, when often, the changed input invalidating the cache would be some other field.

EDIT: Beyond the more robust implementation (former was kind of brittle), this PR is useful, e.g., when re-running fMRIPrep and large lists of files have changed (e.g., the inputs to an fslmerge node with a list of 800 input files).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d8dbc6f7b6a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.