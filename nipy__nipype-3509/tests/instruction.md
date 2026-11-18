# Issue

**Title:** FIX: Deployed Matlab applications must not call addpath()

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

https://mathworks.com/help/compiler/isdeployed.html

> The path of a deployed application is fixed at compile time and cannot change. Use `isdeployed` to ensure that the application uses path modifying functions, such as `addpath`, before deployment.

As suggested by @servoz, this fixes the case where nipype calls SPM12 Standalone, associated to Matlab Compiler Runtime (MCR) R2019a (9.6) or later. Upcoming versions of SPM12 Standalone will most probably be compiled with Matlab R2021b, and hence will be subject to this bug.

.

## List of changes proposed in this PR (pull-request)

* Do not call `addpath` in Matlab scripts called from a deployed Matlab application.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f405f6e2213`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.