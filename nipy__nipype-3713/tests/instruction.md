# Issue

**Title:** [FIX] Set length to 1 when np.squeeze returns a 0D array

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
<!-- Please reference any related issue and use fixes/close to automatically
close them, if pertinent -->

 .

## List of changes proposed in this PR (pull-request)
<!-- We suggest using bullets (indicated by * or -) and filled checkboxes [x] here -->

- try getting the len of `idxs`
- if it fails with TypeError (which happens when `idxs` is a 0D array)
- set `nels` to 1

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a9af62d3621f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.