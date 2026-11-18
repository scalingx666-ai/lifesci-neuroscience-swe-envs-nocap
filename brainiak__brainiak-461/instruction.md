# Issue

**Title:** Unpin scikit-learn and set gamma to auto in SVC tests

## Description

scikit-learn 0.22 changed the default value of `gamma` in `SVC` to 'scale' from 'auto' (see https://scikit-learn.org/stable/modules/generated/sklearn.svm.SVC.html). This PR should hopefulyl fix the tests using SVC by explicitly setting gamma to 'auto' in line with previous behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f0fb5d1b8465`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.