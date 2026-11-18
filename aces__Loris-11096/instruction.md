# Issue

**Title:** [dataquery] Clear filters btn

## Description

## Brief summary of changes

Adds a "Remove all filters" button to the DQT filter step, allowing users to remove all chosen filters with a single action instead of deleting each filter individually. The users are prompted to confirm action to avoid issues with accidental clicks of the button.

### Change preview
<img width="1577" height="1003" alt="Screenshot 2026-07-23 at 11 45 52 AM" src="https://github.com/user-attachments/assets/7a569e60-6785-4559-8693-70655439fe50" />

<img width="1577" height="1003" alt="Screenshot 2026-07-23 at 11 49 42 AM" src="https://github.com/user-attachments/assets/afb212ba-f6f5-4fd0-b117-4546b7910632" />

## Testing instructions

- Open the Data Query module and navigate to the filter editor.
- Add multiple filters.
- Click the Clear Filters button.
- Verify that all filters are removed.
- Confirm that other unsaved selections (e.g. fields and visits) remain unchanged.
- Verify that new filters can be added normally after clearing.

### Link(s) to related issue(s)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `133118de6890`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.