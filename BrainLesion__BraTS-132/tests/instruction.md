# Issue

**Title:** Fix/124 prepostop glioma

## Description

Simple fix to consider all inputs to pre- and post-treatment segmentor as potential post-treatment scans and segment a resection cavity class.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `45dd1bfc6e7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.