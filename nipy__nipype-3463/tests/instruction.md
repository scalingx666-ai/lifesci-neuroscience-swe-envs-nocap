# Issue

**Title:** ENH: Add random seed option to ANTs registration

## Description

<!--

Pull-request guidelines
-----------------------

1. If you would like to list yourself as a Nipype contributor and your name is not mentioned please modify .zenodo.json file.
2. By submitting this request you acknowledge that your contributions are available under the Apache 2 license.
3. Use a descriptive prefix for your PR: ENH (enhancement), FIX, TST, DOC, STY, REF (refactor), WIP (Work in progress)
4. Run `make check-before-commit` before submitting the PR.

-->
## Context

Clinica uses the ANTs registration interfaces for some of its pipelines. Since reproducibility is a major focus for us, it would be desirable to expose and use the random seed option recently introduced to the ANTs registration CLI.

## Summary
<!-- Please reference any related issue and use fixes/close to automatically
close them, if pertinent -->

This PR exposes the corresponding random seed options for `antsRegistration` and `antsRegistrationSynQuick.sh`. Both are named differently but expects its value as an integer. If unspecified, the seed value is computed from the system clock internally according to the documentation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f662acfce8de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.