# Issue

**Title:** FIX: DWIPreproc issue

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
Just a small fix in MRtrix3's DWIPreproc class - referencing `out_grad_mrtrix` instead of `export_grad_mrtrix` in the `_list_outputs` method of the class.

.

## List of changes proposed in this PR (pull-request)
* Fixed DWIPreproc class.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca27e5187e3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.