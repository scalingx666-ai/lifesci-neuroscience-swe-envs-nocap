# Issue

**Title:** Added sticky headers to clusterView & similarityView tables

## Description

table headers disappeared when scrolling in clusterView
Added sticky css position to table th
Had to remove high-dpi transformations in widgets.py because interfered with 'stickiness' property; trade-off necessitates setting a larger font-size with plugin.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `95b0f3aac3ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.