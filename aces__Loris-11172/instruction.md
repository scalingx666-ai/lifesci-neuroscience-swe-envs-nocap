# Issue

**Title:** [dataquery] pin icon line break for non admin users

## Description

## Brief summary of changes
Fixes an unexpected line break in the icon row for the Recent Queries item header where the share icon would drop to a new line for non-admin users.

### Previously
<img width="510" height="101" alt="image" src="https://github.com/user-attachments/assets/86afb7f4-2518-4c78-ac62-cc03e81cfe56" />

### After
<img width="524" height="83" alt="image" src="https://github.com/user-attachments/assets/b9ebf76f-da2b-4311-8a7c-7285e551120e" />


## Testing instructions

  1. Log in with a user account that does not have admin (superuser) permissions.
  2. Navigate to the Data Query Tool (beta).
  3. View any recent query under the Recent Queries section.
  4. All icons should render horizontally inline on a single line.

## Link(s) to related issue(s)

*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0eb19ac51165`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.