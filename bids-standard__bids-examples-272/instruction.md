# Issue

**Title:** CI: auto-cancel duplicate CI jobs

## Description

this [new feature for GH actions](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#concurrency) may be helpful for the case where we open a PR to this repo **from** this repo (as oppposed to **from** a fork).

In those cases we had duplicate jobs running in the past, marked by "pull" and "push" --> with this feature, the duplicates should be cancelled.

Example of what we don't want anymore (screenshot):

![image](https://user-images.githubusercontent.com/9084751/118770283-6df50c00-b881-11eb-967a-c13b1c72d875.png)


see CI in

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f503bf19823`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.