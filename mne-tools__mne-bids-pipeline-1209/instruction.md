# Issue

**Title:** MAINT: Dont cache website docs

## Description

No reason to cache the source docs since `mike deploy` overwrites history every time. This should fix a really annoying error that has cropped up that I'm trying to fix via SSH :crossed_fingers:  (see https://app.circleci.com/pipelines/gh/mne-tools/mne-bids-pipeline/5523/details)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3995adc9e9e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.