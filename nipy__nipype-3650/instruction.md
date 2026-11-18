# Issue

**Title:** [FIX] mat 7.3 support for SPM.mat files

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




## List of changes proposed in this PR (pull-request)
* Replace `sio.loadmat` with a load function specific for `SPM.mat` files, so it also supports >2 GB mat 7.3 HDR files
* Fix MATLAB's `test_run_interface` which I also encountered while running the tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e03ab6f99f85`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.