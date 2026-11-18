# Issue

**Title:** Account for dummy scans in workflows

## Description

. One thing that I have been failing to do is write and push tests that fail before implementing a bug fix. I am trying to adopt that approach more consistently, starting in this PR. Note that the first commit fails due to #1401 because I added an explicit check, and then the next commit fixes it.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Update tests to fail when dummy scans are not accounted for correctly (i.e., the optcom file should be `dummy_scans` shorter than the input data).
- Remove `dummy_scans` from `data_cat` in t2smap and tedana workflows. It looks like ica_reclassify is already good.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9024b201943`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.