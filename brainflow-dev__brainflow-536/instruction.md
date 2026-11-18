# Issue

**Title:** Update psd_len calculation in get_psd_welch

## Description

This PR updates the psd_len calculation in get_psd_welch() to use nfft instead of data_len.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `55a251e05dc9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.