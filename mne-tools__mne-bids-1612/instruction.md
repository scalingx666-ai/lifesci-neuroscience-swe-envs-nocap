# Issue

**Title:** FIX: montage deprecation

## Description

We need to address some[ CI failures](https://github.com/mne-tools/mne-bids/actions/runs/26308246239/job/77451229046?pr=1611) after

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c3187b2af13a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.