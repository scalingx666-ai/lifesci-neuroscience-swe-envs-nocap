# Issue

**Title:** FIX: Avoid excessive etelemetry pings

## Description

In cases where `check_latest_version` returned None, each time
`BaseInterface.__init__` was called would lead to another server ping.
This avoids this loop by falling to a string, n/a, if the server fails
to produce a version.

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

## List of changes proposed in this PR (pull-request)
<!-- We suggest using bullets (indicated by * or -) and filled checkboxes [x] here -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71c7a7d53157`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.