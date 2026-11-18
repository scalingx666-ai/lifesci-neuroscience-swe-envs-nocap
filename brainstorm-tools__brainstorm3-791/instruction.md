# Issue

**Title:** Bugfix: For `linefit`, update only the current selected 3D figure

## Description

Introduced in 2ea6b5c

**Error:** When multiple 3D figures are open, on selecting the electrode(s) in iEEG panel and clicking `Contacts > Show/Hide line fit through contacts`, the following error occurs as it tries to update all the figures.

![Screenshot 2025-05-06 151652](https://github.com/user-attachments/assets/5b1c5faa-4f88-44d9-8620-edb5e98eda6e)

It makes more sense to just update the current selected 3D figure. This PR addresses that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c85a1719a17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.