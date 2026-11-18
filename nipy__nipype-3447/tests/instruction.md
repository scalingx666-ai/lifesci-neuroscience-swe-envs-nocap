# Issue

**Title:** [ENH] Add Text2Vest and Vest2Text interfaces

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
Create Text2Vest Interface to work directly with `FILMGLS`

References poldracklab/fitlins#114

## List of changes proposed in this PR (pull-request)
<!-- We suggest using bullets (indicated by * or -) and filled checkboxes [x] here -->
- add `Text2Vest` interface
- add `Vest2Text` interface

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8f7fb57e870`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.