# Issue

**Title:** CI: Simplify actions to build once, test many

## Description

This PR reduces a lot of duplicated testing in GHA.

1) Build the packages once and only once.
2) Test version strings and pytest across various installation methods.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad4401c95583`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.