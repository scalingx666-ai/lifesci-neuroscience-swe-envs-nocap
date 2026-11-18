# Issue

**Title:** [ENH] Issue 3345: Adding FreeSurfer longitudinal interfaces

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

Adds FreeSurfer longitudinal interfaces per issue 

## List of changes proposed in this PR (pull-request)
<!-- We suggest using bullets (indicated by * or -) and filled checkboxes [x] here -->
- Add BaseReconAll to allow running recon-all with timepoints to create a base template.
- Add LongReconAll to allow running recon-all for a session given a base template.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a9e25e13f6d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.