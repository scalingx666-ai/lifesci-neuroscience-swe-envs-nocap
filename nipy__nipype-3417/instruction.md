# Issue

**Title:** [FIX] Escape metacharacters when parsing dcm2niix outputs

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
This PR should fix the issue with dcm2niix interface not able to parse the output files when the file name contains meta characters. 

 .

## List of changes proposed in this PR (pull-request)
<!-- We suggest using bullets (indicated by * or -) and filled checkboxes [x] here -->

## Acknowledgment

- [X] \(Mandatory\) I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f756b7111749`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.