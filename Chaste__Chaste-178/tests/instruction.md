# Issue

**Title:** Add summary, and prioritise failing tests

## Description

This update will add a summary to the index page, and prioritise the failing tests to make the summaries easier to navigate.

The summary info will be parsed to shade the index table rows as green orange or red, making it easier to see at a glance which memory testing runs are failing.

Example of the new index page after this update:

![image](https://github.com/Chaste/Chaste/assets/3770306/3a015b69-5f0f-498b-a736-472420e1b45a)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c842afae70eb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.