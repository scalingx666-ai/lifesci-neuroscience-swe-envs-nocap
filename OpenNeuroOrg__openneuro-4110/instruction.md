# Issue

**Title:** Add "Back to dataset" link on file viewer page

## Description

Clicking **visualize** on an NWB file (which opens Neurosift) navigates to the `file-display/:filePath` route, which had no way back to the dataset other than the browser back button.

EDIT: I will note that it IS currently possible to achieve similar results by clicking the 'Files' tab at the top; but this was not obvious and was only discovered incidentally after more experience in the OpenNeuro UX.

To fix this I added a `FileDisplayBackLink` component to `file-display.tsx` that links to `/datasets/:id`, or to `/datasets/:id/versions/:tag` when viewing a snapshot.

Example: https://openneuro.org/datasets/ds008610/versions/1.0.0/file-display/sub-01:ses-ieeg01:ieeg:sub-01_ses-ieeg01_task-FUS_acq-VPL_run-005_ieeg.nwb

This results in the following before/after screenshot:

<img width="2042" height="562" alt="image" src="https://github.com/user-attachments/assets/b2c4b6c9-6a25-4015-b30f-40b89f0f07eb" />

---
🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01NZt1FdtGq85JEukDnMUffk

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1bfb90f92d42`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.