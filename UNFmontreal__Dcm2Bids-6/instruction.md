# Issue

**Title:** Add support for anonymizer plugin

## Description

Makes it easy to de-face anatomicals. The basic idea is to call some command-line app with each anat acquisition that is encountered.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29dba4393637`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.