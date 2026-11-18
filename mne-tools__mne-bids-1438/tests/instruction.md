# Issue

**Title:** MAINT: Fix dep for release

## Description

Should fix https://github.com/mne-tools/mne-bids/actions/runs/17620708872/job/50065537045#step:3:144

Bummer that `twine` didn't catch this

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67146c59370b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.