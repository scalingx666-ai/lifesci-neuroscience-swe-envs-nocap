# Issue

**Title:** [publication] Add submitted publishing status

## Description

## Brief summary of changes

- Adds `Submitted` as a publication publishing status alongside `In Progress` and `Published`.
- Updates the publication proposal form and publication list filter to expose all three statuses.
- Adds the database schema update and upgrade patch while preserving existing status values.
- Adds translation entries and manual testing instructions for the publishing statuses.

<img width="1678" height="996" alt="image" src="https://github.com/user-attachments/assets/29cff772-0d84-413c-9b7c-66f3ac8de4e9" />


#### Testing instructions 

- Apply `SQL/New_patches/2026-08-26-add-publication-submitted-status.sql`.
- Open `/publication/` as a user with publication proposal access.
- Open **Propose a Project** and confirm **Publishing Status** offers **In Progress**, **Submitted**, and **Published**.
- Save a proposal with each status and confirm the selected value appears in the publication table.
- Reopen the proposal and confirm the selected publishing status persists.
- Filter the publication table by **Submitted** and confirm only submitted proposals appear.

#### Link(s) to related issue(s)

-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9f1d42b619b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.