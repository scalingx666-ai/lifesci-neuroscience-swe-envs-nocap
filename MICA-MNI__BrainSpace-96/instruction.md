# Issue

**Title:** add Schaefer 1000 to parcellations

## Description

Added an extra .csv file for Schaefer 1000 parcels (7 networks) to `parcellations`.

<img width="500" alt="Screenshot 2023-03-16 at 17 15 58" src="https://user-images.githubusercontent.com/49495286/225684567-301a4064-2624-4534-a526-aac489a280f6.png">

The parcels look fine when plotted.
Potentially addresses this issue:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bcc3607209e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.