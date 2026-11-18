# Issue

**Title:** [FIX] Removed exists=True from MathsOutput

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
When setting MathsCommand().inputs.out_file argument, a Trait error is thrown because of the exists=True, although this file is to be created. This PR fixed this by removing the `exists=True` argument.

 .

## List of changes proposed in this PR (pull-request)
* Removed `exists=True` from `MathsOutput` `File()`.

## Acknowledgment

- [x] \(Mandatory\) I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a7837c09943`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.