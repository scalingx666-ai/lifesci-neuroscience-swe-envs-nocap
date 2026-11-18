# Issue

**Title:** Sidebar: Agent Skills count and sync dots back on the checkbox column

## Description

## Problem

In the sidebar, the Agent Skills count and the sync dots no longer line up with the NOTES header's checkbox and the bug icon, which `d8316055` put in one column.

- **The count was 28px right of the column.** `0b79a5e5` widened `.skills-shortcut-row` by 38px so its hover highlight matches the tree rows, and kept `padding-right: 10px`. That moved the count by the same amount.
- **The dots were 7.5px right.** `translateX(15.5px)` was added on top of an existing `translateX(8px)` rule, and replaced it.

## Change

`styles/redesign.css`:
- `.skills-shortcut-row` gets `padding-right: 38px`. The highlight keeps its full width, and the count goes back on the column.
- The extra `.tree-sync` shift is removed, so the existing 8px rule applies.

## Check

Measured in the window simulator (`dev/window-simulator`, 328px sidebar). Before, the checkbox was at 279, the dots at 286.5, the count at 307 and the bug icon at 279. After, all four are at **279**.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7db03e87dd12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.