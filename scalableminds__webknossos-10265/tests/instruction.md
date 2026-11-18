# Issue

**Title:** Hide Connectome tab without connectome files and AbsTree tab by default

## Description

### Summary
- The `Connectome` tab is now only shown if a segmentation layer (or the fallback layer of a volume annotation layer) has connectome attachments. The attachments are already part of the dataset's `dataSource` JSON, so no extra request is needed.
- The `AbsTree` tab is no longer part of the default layout. It can be opened via **Show Abstract Tree** in the Skeleton tab's actions menu and can be closed again.
- Layout version stays at 17, so stored layouts are kept. They still contain the AbsTree tab, but it is made closable on load.

### Steps to test:
- Open a dataset without connectome files → no `Connectome` tab.
- Open a dataset with a connectome file (e.g. "L4 Dense Connectome") → `Connectome` tab is shown and works.
- Open a skeleton annotation with an existing stored layout → AbsTree tab is still there, but has a × to close it. Layout customizations are kept.
- Skeleton tab ☰ → **Show Abstract Tree** → tab opens next to the Skeleton tab and is selected. Close it via ×; reopen via the menu.

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Updated [documentation](../blob/master/docs) if applicable
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eb4021b13e74`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.