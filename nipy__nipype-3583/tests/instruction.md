# Issue

**Title:** Fix bugs with `fsl_out=True` and `lta_out=True`

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

The options 'fsl_out' and 'lta_out'in TKregister2 should check and add arguments with 'fsl_file' and 'lta_file' respectively. Otherwise, a key error would be raised when setting `fsl_out=True` or `lta_out=True`

## List of changes proposed in this PR (pull-request)
<!-- We suggest using bullets (indicated by * or -) and filled checkboxes [x] here -->
- Fix `Tkregister2._format_arg` so that `fsl_out=True` and `lta_out=True` options use the correct name for the argument and finding the argument value
- Add contribution

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `68a7cd436eb2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.