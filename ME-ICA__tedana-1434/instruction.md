# Issue

**Title:** Change T2* ceiling to seconds

## Description

Closes none, but patches something I missed in #1425.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Replace infinite T2* values with 0.5 (500 ms) instead of 500 (artifact from when we had ms-based T2*).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70c986106e2f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.