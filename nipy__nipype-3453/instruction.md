# Issue

**Title:** RF: Rearranging matmul order and using hermitian flag in ICC_rep_anova

## Description

<!--

Pull-request guidelines
-----------------------

1. If you would like to list yourself as a Nipype contributor and your name is not mentioned please modify .zenodo.json file.
2. By submitting this request you acknowledge that your contributions are available under the Apache 2 license.
3. Use a descriptive prefix for your PR: ENH (enhancement), FIX, TST, DOC, STY, REF (refactor), WIP (Work in progress)
4. Run `make check-before-commit` before submitting the PR.

-->
## Summary
See 

## List of changes proposed in this PR (pull-request)
Calculation of predicted_Y refactored such that:
* numpy.dot is replaced with the @ operator 
* The pseudo-inverse of X.T@X is now calculated with the hermitian flag set to True (pinv uses a more efficient algorithm when the matrix input is assumed to be hermitian, which will always be the case with X.T@X in this function).
* The matrix multiplication order is changed in a way that we don't end up multiplying as many fat matrices as before.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d065ca8381f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.