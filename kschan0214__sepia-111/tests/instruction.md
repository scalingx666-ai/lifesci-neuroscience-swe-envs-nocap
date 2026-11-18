# Issue

**Title:** Add support for V-Sharp 2D BGFR

## Description

This is a background field removal algorithm specifically designed to deal with two-dimensional acquisitions (such as e.g. EPI based).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4974b04e669f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.