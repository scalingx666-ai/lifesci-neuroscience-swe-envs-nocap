# Issue

**Title:** [FIX] `ts_Z_corr` → `ts_wb_Z`

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

* https://github.com/nipy/nipype/blob/237a9a7ca244ca87916e1f9c5bd73c3f08c00c5d/nipype/interfaces/afni/preprocess.py#L2744 ↓ https://github.com/nipy/nipype/blob/44e9d675d9773baaaa9aeddf38ce6a8d04a208b0/nipype/interfaces/afni/preprocess.py#L2744
  * Replaces `NetCorr.inputs.ts_Z_corr` with `NetCorr.inputs.ts_wb_Z`
  * Unwraps `ts_wb_*` checks from `isdefined`
* Adds myself to `.zenodo.json` https://github.com/nipy/nipype/blob/cbcb487a90eb293acfabf1a444383c4a4dfa64c8/.zenodo.json#L923-L927

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `237a9a7ca244`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.