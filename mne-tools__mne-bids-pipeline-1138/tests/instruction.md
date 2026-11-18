# Issue

**Title:** ENH: Report bad channel statuses

## Description

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)



Running `pytest mne_bids_pipeline/ -k ds004229` I now see this new section (HTML modified by me to make it print two channel names so you can see the spacing):

<img width="1296" height="999" alt="image" src="https://github.com/user-attachments/assets/77d1d75c-f22f-41ce-b0ad-2fa01ba5fdc5" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9df4b79a4aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.