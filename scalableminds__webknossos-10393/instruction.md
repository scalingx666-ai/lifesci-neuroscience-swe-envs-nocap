# Issue

**Title:** Link multi-tile alignment card to alignment projects

## Description

### Summary
The "Align & stitch multiple tiles" card in the AI alignment job modal no longer shows "Coming Soon". Clicking it now opens Alignment Projects in a new tab. Users who aren't admins or dataset managers can't access alignment projects, so for them the card stays disabled with an "Admins & dataset managers only" tag.

![Alignment task cards for admins (top) and regular members (bottom)](https://github.com/user-attachments/assets/4db14ac3-5b36-454b-8b3c-fbefdb835e34)

### Steps to test:
- As an admin, open a dataset → AI Jobs → Image Alignment. Click the multi-tile card: `/alignmentProjects` opens in a new tab and the card doesn't get selected.
- As a regular member, the card is disabled and shows the "admins only" tag.

------
- [x] Added changelog entry
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `088c4f1721a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.