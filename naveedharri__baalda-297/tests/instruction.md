# Issue

**Title:** Hotfix 0.1.77: collapsed folders and faster access Board

## Description

Version 0.1.77. On the member Access tab's Board view, folders now start collapsed and the view is fast on large vaults. In large vaults every folder used to render fully expanded, so a column could run to thousands of rows and became endless to scroll.

What changed
- Folder rows are collapsed by default. A collapsed folder hides everything under it in that column.
- A folder that holds rows in the column gets the List view's chevron toggle at the left of its icon. It is a real button with aria-expanded and an "Expand X" / "Collapse X" label, reachable by Tab. Pressing it never starts a drag; the rest of the row is still the drag handle and the arrows are unchanged.
- A collapsed folder shows a muted count of the items inside it in that column.
- Grey path rows never collapse, so the path to an item that lives in another column stays visible.
- Each column's menu gains Expand all and Collapse all above Add all and Remove all. They stay available to people who cannot change access.
- Expansion is view state only. It resets when the member or vault changes, and a folder keeps its expansion when it moves between columns.
- The visible rows are computed in one linear pass per column, and only those rows are rendered.

Performance
- Each row's access answer used to copy the whole access map and rebuild the board model, so the cost grew with the square of the row count; answers are now buffered and applied in one update, which takes the 14,675-row case from about 14 s of work to about 50 ms.
- Rows are memoised with stable handlers, so a drag, a column highlight, a landing or an expand re-renders no unrelated rows. Vault-wide writes find affected rows through sets instead of rescanning every row per row. Sorting splits each path once with one shared collator, giving the same order.
- Nothing visual changed. A new test asserts the board build stays linear at 15,000 and 30,000 rows, and another asserts zero row re-renders during a drag across all three columns.

Tests
- Ran the Board component tests, the new visible-row unit tests, the Board failure tests, the Members tab tests and the members-access logic tests: 8 files, 80 tests passed.
- Desktop typecheck is clean.

After merge, staging must be fast-forwarded onto main.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3437d45a8116`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.