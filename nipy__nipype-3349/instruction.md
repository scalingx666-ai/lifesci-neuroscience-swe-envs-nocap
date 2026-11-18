# Issue

**Title:** MAINT: Simplify interface execution and better error handling of ``Node``

## Description

Revises the implementation of ``Node`` simplifying some details and improves the error handling of plugins. Introduces a ``NodeExecutionError`` (custom alias of ``RuntimeError``) that allows more specificity with errors, if needed.

Requires: #3347.

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

Fixes # .

## List of changes proposed in this PR (pull-request)
<!-- We suggest using bullets (indicated by * or -) and filled checkboxes [x] here -->

## Acknowledgment

- [X] \(Mandatory\) I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb125ab10b76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.