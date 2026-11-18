# Issue

**Title:** ENH: Be more tolerant of MEG channel type

## Description

Should fix https://app.circleci.com/pipelines/gh/mne-tools/mne-bids-pipeline/5572/workflows/99363790-eb42-4437-93fe-8e03abc8ee9c/jobs/103767

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea008ec5f04a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.